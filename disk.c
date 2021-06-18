/*
 * Copyright (C) 2014-2020 ChaN
 * Copyright (C) 2019-2021 saybur
 * 
 * This file is part of scuznet.
 * 
 * scuznet is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * scuznet is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with scuznet.  If not, see <https://www.gnu.org/licenses/>.
 */

/*
 * Most of functions here are derived from pfsample.zip and ffsample.zip,
 * available at the following links:
 * 
 * http://elm-chan.org/fsw/ff/00index_p.html
 * http://elm-chan.org/fsw/ff/00index_e.html
 * 
 * The original license for these is:
 * 
 * > These sample projects for FatFs module are free software and there is NO
 * > WARRANTY. You can use, modify and redistribute it for personal, non-profit
 * > or commercial use without any restriction UNDER YOUR RESPONSIBILITY.
 */

#include <avr/io.h>
#include <stdlib.h>
#include <util/atomic.h>
#include <util/delay.h>
#include "./lib/pff/pff.h"
#include "./lib/pff/diskio.h"
#include "config.h"

#define cs_assert()         (MEM_PORT.OUTCLR = MEM_PIN_CS)
#define cs_release()        (MEM_PORT.OUTSET = MEM_PIN_CS)
#define is_cs_asserted()    (! (MEM_PORT.IN & MEM_PIN_CS))
#define data_not_ready()    (! (MEM_USART.STATUS & USART_RXCIF_bm))
#define dma_not_ready()     (! (MEM_DMA_READ.CTRLB & (DMA_CH_ERRIF_bm | DMA_CH_TRNIF_bm)))

#define mem_timed_out()	    (MEM_TIMER.INTFLAGS & TC0_OVFIF_bm)

#define CMD0                (0)	      // GO_IDLE_STATE
#define CMD1                (1)       // SEND_OP_COND (MMC)
#define	ACMD41              (0x80+41) // SEND_OP_COND (SDC)
#define CMD8                (8)       // SEND_IF_COND
#define CMD9                (9)       // SEND_CSD
#define CMD10               (10)      // SEND_CID
#define CMD12               (12)      // STOP_TRANSMISSION
#define ACMD13              (0x80+13) // SD_STATUS (SDC)
#define CMD16               (16)      // SET_BLOCKLEN
#define CMD17               (17)      // READ_SINGLE_BLOCK
#define CMD18               (18)      // READ_MULTIPLE_BLOCK
#define CMD23               (23)      // SET_BLOCK_COUNT (MMC)
#define	ACMD23              (0x80+23) // SET_WR_BLK_ERASE_COUNT (SDC)
#define CMD24               (24)      // WRITE_BLOCK
#define CMD25               (25)      // WRITE_MULTIPLE_BLOCK
#define CMD32               (32)      // ERASE_ER_BLK_START
#define CMD33               (33)      // ERASE_ER_BLK_END
#define CMD38               (38)      // ERASE
#define	CMD48               (48)      // READ_EXTR_SINGLE
#define	CMD49               (49)      // WRITE_EXTR_SINGLE
#define CMD55               (55)      // APP_CMD
#define CMD58               (58)      // READ_OCR

#define CT_MMC3             0x01      // MMC ver 3
#define CT_MMC4             0x02      // MMC ver 4+
#define CT_MMC              0x03      // MMC
#define CT_SDC1             0x04      // SDv1
#define CT_SDC2             0x08      // SDv2+
#define CT_SDC              0x0C      // SD
#define CT_BLOCK            0x10      // block addressing

static volatile uint8_t card_status = STA_NOINIT;
static uint8_t card_type;

/*
 * Sends a byte to the memory card, returning the response.
 * 
 * This does not use the USART buffers and is thus slow. Use alternatives
 * for sending bulk data.
 */
static inline __attribute__((always_inline)) uint8_t mem_send(uint8_t data)
{
	while (! (MEM_USART.STATUS & USART_DREIF_bm));
	MEM_USART.DATA = data;
	while (! (MEM_USART.STATUS & USART_RXCIF_bm));
	return MEM_USART.DATA;
}

/*
 * Sets up the memory timer to overflow after the given number of
 * milliseconds passes (approximately). Maximum wait time is about 2 seconds.
 * 
 * This call assumes a fixed clock speed of 32MHz, which may not be the case in
 * the future.
 */
static void mem_setup_timeout(uint16_t ms)
{
	MEM_TIMER.CTRLA = TC_CLKSEL_OFF_gc;
	MEM_TIMER.CTRLFSET = TC_CMD_RESET_gc;
	// clk/1024 is 32us/tick, * 32 = 1.024ms
	MEM_TIMER.PER = (ms << 5);
	MEM_TIMER.CTRLA = TC_CLKSEL_DIV1024_gc;
}

/*
 * Sends 0xFF to the card until it is no longer busy, or until the timeout is
 * reached. Returns true on ready, false otherwise.
 */
static uint8_t mem_wait_ready(uint16_t ms)
{
	uint8_t v;
	mem_setup_timeout(ms);
	do
	{
		v = mem_send(0xFF);
	}
	while (v != 0xFF && (! mem_timed_out()));
	return (v == 0xFF) ? 1 : 0;
}

static void mem_deselect(void)
{
	cs_release();
	mem_send(0xFF);
}

static uint8_t mem_select(void)
{
	cs_assert();
	mem_send(0xFF);
	if (mem_wait_ready(500)) return 1; // ok
	mem_deselect();
	return 0; // timeout
}

static uint8_t mem_bulk_read(uint8_t* buffer, uint16_t start, uint16_t count)
{
	uint8_t token;
	uint16_t i;
	uint16_t end = start + count;
	if (end > 512) end = 512;
	
	mem_setup_timeout(200);
	do
	{
		token = mem_send(0xFF);
	}
	while (token == 0xFF && (! mem_timed_out()));
	if (token != 0xFE) return 0;
	
	// first two
	MEM_USART.DATA = 0xFF;
	while (! (MEM_USART.STATUS & USART_DREIF_bm));
	MEM_USART.DATA = 0xFF;

	// toss until start
	for (i = 0; i < start; i++)
	{
		while (data_not_ready());
		MEM_USART.DATA;
		MEM_USART.DATA = 0xFF;
	}
	for ( ; i < end; i++)
	{
		while (data_not_ready());
		*buffer++ = MEM_USART.DATA;
		MEM_USART.DATA = 0xFF;
	}
	for ( ; i < 512; i++)
	{
		while (data_not_ready());
		MEM_USART.DATA;
		MEM_USART.DATA = 0xFF;
	}

	// trash CRC
	while (data_not_ready());
	MEM_USART.DATA;
	while (data_not_ready());
	MEM_USART.DATA;
	
	return 1;
}

/*
 * Resets the USART to initialization mode, without interrupts or reception,
 * and sends 80 XCK clocks with /CS and TX set high to put the card into
 * native mode.
 * 
 * This should probably only be called when the USART is idle, or strange
 * behavior may result.
 */
static void mem_reset(void)
{
	cs_release();
	// disable the USART
	MEM_USART.CTRLB = 0;
	MEM_USART.CTRLC = USART_CMODE_MSPI_gc; // SPI mode 0,0
	MEM_USART.CTRLA = 0;
	// set the baudrate to the initialization defaults
	MEM_USART.BAUDCTRLA = MEM_BAUDCTRL_INIT;
	MEM_USART.BAUDCTRLB = 0;
	// (re)enable the USART again, in TX mode only
	MEM_USART.CTRLB = USART_TXEN_bm;

	/*
	 * Send at least 74 clocks (we send 80) with /CS and TX high to put the
	 * card into native mode and wait for bytes to finish sending before
	 * returning.
	 */
	MEM_USART.DATA = 0xFF;
	for (uint8_t i = 0; i < 9; i++)
	{
		while (! (MEM_USART.STATUS & USART_DREIF_bm));
		MEM_USART.DATA = 0xFF;
	}
	while (! (MEM_USART.STATUS & USART_TXCIF_bm));
	MEM_USART.STATUS = USART_TXCIF_bm;
	
	// enable the receiver
	MEM_USART.CTRLB |= USART_RXEN_bm;
}

static uint8_t mem_cmd(uint8_t cmd, uint32_t arg)
{
	uint8_t n, res;
	
	// ACMD<n> is the command sequense of CMD55-CMD<n>
	if (cmd & 0x80)
	{
		cmd &= 0x7F;
		uint8_t res = mem_cmd(CMD55, 0);
		if (res > 1) return res;
	}
	
	// select the card, unless stopping a multiple block read
	if (cmd != CMD12)
	{
		mem_deselect();
		if (! mem_select()) return 0xFF;
	}

	// send a command packet
	mem_send(cmd | 0x40);
	mem_send((uint8_t) (arg >> 24));
	mem_send((uint8_t) (arg >> 16));
	mem_send((uint8_t) (arg >> 8));
	mem_send((uint8_t) arg);
	switch(cmd)
	{
		case CMD0:
			n = 0x95;
			break;
		case CMD8:
			n = 0x87;
			break;
		default:
			n = 0x01; // dummy CRC + stop
	}
	mem_send(n);
	
	// skip stuff byte when stopping a multiple block read
	if (cmd == CMD12) mem_send(0xFF);
	
	// wait for response
	n = 10;
	do
	{
		res = mem_send(0xFF);
	}
	while ((res & 0x80) && --n);
	return res;
}

/*
 * ============================================================================
 *   Public Functions
 * ============================================================================
 */

DSTATUS disk_initialize(void)
{
	uint8_t n, cmd, type, ocr[4];

	mem_reset();
	
	type = 0;
	if (mem_cmd(CMD0, 0) == 1) // go to SPI mode
	{
		// limit total init time to ~1 second
		mem_setup_timeout(1000);
		
		if (mem_cmd(CMD8, 0x1AA))
		{
			// SDv2
			for (n = 0; n < 4; n++)
			{
				ocr[n] = mem_send(0xFF);
			}
			if (ocr[2] == 0x01 && ocr[3] == 0xAA)
			{
				// wait to leave idle state (ACMD41 with HCS bit)
				while ((! mem_timed_out()) && mem_cmd(ACMD41, 1UL<<30));

				// check CCS bit in the OCR
				if ((! mem_timed_out()) && mem_cmd(CMD58, 0) == 0)
				{
					for (n = 0; n < 4; n++)
					{
						ocr[n] = mem_send(0xFF);
					}
					// SDv2 (HC or SC)
					type = (ocr[0] & 0x40) ? CT_SDC2 | CT_BLOCK : CT_SDC2;
				}
			}	
		}
		else
		{
			if (mem_cmd(ACMD41, 0) <= 1)
			{
				// SDv1
				type = CT_SDC1;
				cmd = ACMD41;
			}
			else
			{
				// MMCv3
				type = CT_MMC;
				cmd = CMD1;
			}
			// wait to leave idle state
			while ((! mem_timed_out()) && mem_cmd(cmd, 0));

			// set R/W block length to 512
			if (mem_timed_out() || mem_cmd(CMD16, 512) != 0)
			{
				type = 0;
			}
		}
	}
	
	card_type = type;
	mem_deselect();
	
	if (type)
	{
		card_status &= ~STA_NOINIT;
		MEM_USART.BAUDCTRLA = MEM_BAUDCTRL_NORMAL;
		MEM_USART.BAUDCTRLB = 0;
	}
	
	return card_status;
}

DRESULT disk_readp(
	BYTE *buff,     // pointer to the read buffer, or null for stream
	DWORD sector,   // LBA
	UINT offset,    // byte offset to start reading from
	UINT count      // number of bytes to read
)
{
	if (card_status & STA_NOINIT) return RES_NOTRDY;
	if (! count) return RES_PARERR;
	
	if (! (card_type & CT_BLOCK)) sector *= 512;
	DRESULT res = RES_ERROR;
	if (mem_cmd(CMD17, sector) == 0)
	{
		if (mem_bulk_read(buff, offset, count)) res = RES_OK;
	}
	mem_deselect();
	return res;
}

#if PF_USE_WRITE
DRESULT disk_writep (
	const BYTE *buff,    // pointer to the bytes to be written
	DWORD sc             // number bytes to send, LBA, or zero
)
{
	if (card_status & STA_NOINIT) return RES_NOTRDY;

	DRESULT res;
	UINT bc;
	static UINT wc; // sector write counter
	
	res = RES_ERROR;
	
	if (buff)
	{
		bc = sc;
		while (bc && wc)
		{
			mem_send(*buff++);
			wc--;
			bc--;
		}
		res = RES_OK;
	}
	else
	{
		if (sc)
		{
			// start sector write
			
			// convert to byte address if needed
			if (! (card_type & CT_BLOCK)) sc *= 512;
			if (mem_cmd(CMD24, sc) == 0)
			{
				mem_send(0xFF);
				mem_send(0xFE);
				wc = 512;
				res = RES_OK;
			}
		}
		else
		{
			bc = wc + 2;
			// fill leftover bytes and CRC with zeros
			while (bc--) mem_send(0x00);
			
			// receive data rseponse and wait for end of write
			// timeout is 500ms
			if ((mem_send(0xFF) & 0x1F) == 0x05)
			{
				// wait until card is ready
				for (bc = 5000; mem_send(0xFF) != 0xFF && bc; bc--)
				{
					_delay_us(100);
				}
				if (bc) res = RES_OK;
			}
			
			cs_release();
			mem_send(0xFF);
		}
	}
	
	return res;
}
#endif
