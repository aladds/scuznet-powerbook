EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLedger 17000 11000
encoding utf-8
Sheet 1 1
Title "scuznet"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L scuznet-rescue:RJ45_Amphenol_RJMG1BD3B8K1ANR-Connector J3
U 1 1 5D897ED1
P 12400 4700
F 0 "J3" H 12500 5300 50  0000 L CNN
F 1 "RJ45-TRANSFO" H 12350 5300 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_RJMG1BD3B8K1ANR" H 12400 4700 50  0001 C CNN
F 3 "" H 12400 4700 50  0001 C CNN
	1    12400 4700
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR029
U 1 1 5D897ED2
P 5300 5650
F 0 "#PWR029" H 5300 5400 50  0001 C CNN
F 1 "GND" H 5300 5500 50  0000 C CNN
F 2 "" H 5300 5650 50  0001 C CNN
F 3 "" H 5300 5650 50  0001 C CNN
	1    5300 5650
	-1   0    0    -1  
$EndComp
$Comp
L scuznet-rescue:C-Device C6
U 1 1 5D897ED4
P 6200 5450
F 0 "C6" H 6225 5550 50  0000 L CNN
F 1 "10uF" H 6225 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6238 5300 50  0001 C CNN
F 3 "" H 6200 5450 50  0001 C CNN
	1    6200 5450
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR030
U 1 1 5D897ED5
P 6200 5700
F 0 "#PWR030" H 6200 5450 50  0001 C CNN
F 1 "GND" H 6200 5550 50  0000 C CNN
F 2 "" H 6200 5700 50  0001 C CNN
F 3 "" H 6200 5700 50  0001 C CNN
	1    6200 5700
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR032
U 1 1 5D897ED7
P 6100 4750
F 0 "#PWR032" H 6100 4500 50  0001 C CNN
F 1 "GND" H 6100 4600 50  0000 C CNN
F 2 "" H 6100 4750 50  0001 C CNN
F 3 "" H 6100 4750 50  0001 C CNN
	1    6100 4750
	1    0    0    -1  
$EndComp
Text Label 6600 4000 2    50   ~ 0
TPIN+
Text Label 6600 4100 2    50   ~ 0
TPIN-
Text Label 9700 4200 0    50   ~ 0
TPOUT+
Text Label 9700 4400 0    50   ~ 0
TPOUT-
Text Label 9700 4800 0    50   ~ 0
TPIN+
Text Label 9700 5000 0    50   ~ 0
TPIN-
$Comp
L scuznet-rescue:R-Device R18
U 1 1 5D897ED8
P 10100 3950
F 0 "R18" V 10180 3950 50  0000 C CNN
F 1 "49.9" V 10100 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10030 3950 50  0001 C CNN
F 3 "" H 10100 3950 50  0001 C CNN
	1    10100 3950
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R19
U 1 1 5D897EDA
P 10300 3950
F 0 "R19" V 10380 3950 50  0000 C CNN
F 1 "49.9" V 10300 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 3950 50  0001 C CNN
F 3 "" H 10300 3950 50  0001 C CNN
	1    10300 3950
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:Ferrite_Bead-Device L1
U 1 1 5D897EDB
P 11250 3700
F 0 "L1" V 11100 3725 50  0000 C CNN
F 1 "Ferrite_Bead" V 11400 3700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" V 11180 3700 50  0001 C CNN
F 3 "" H 11250 3700 50  0001 C CNN
	1    11250 3700
	0    1    1    0   
$EndComp
$Comp
L scuznet-rescue:C-Device C29
U 1 1 5D897EDD
P 10600 3950
F 0 "C29" H 10625 4050 50  0000 L CNN
F 1 "100nF" H 10625 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10638 3800 50  0001 C CNN
F 3 "" H 10600 3950 50  0001 C CNN
	1    10600 3950
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR034
U 1 1 5D897EDE
P 10600 4500
F 0 "#PWR034" H 10600 4250 50  0001 C CNN
F 1 "GND" H 10600 4350 50  0000 C CNN
F 2 "" H 10600 4500 50  0001 C CNN
F 3 "" H 10600 4500 50  0001 C CNN
	1    10600 4500
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R16
U 1 1 5D897EDF
P 10100 5250
F 0 "R16" V 10180 5250 50  0000 C CNN
F 1 "49.9" V 10100 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10030 5250 50  0001 C CNN
F 3 "" H 10100 5250 50  0001 C CNN
	1    10100 5250
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R17
U 1 1 5D897EE0
P 10300 5250
F 0 "R17" V 10380 5250 50  0000 C CNN
F 1 "49.9" V 10300 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10230 5250 50  0001 C CNN
F 3 "" H 10300 5250 50  0001 C CNN
	1    10300 5250
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:C-Device C28
U 1 1 5D897EE1
P 10300 5750
F 0 "C28" H 10325 5850 50  0000 L CNN
F 1 "100nF" H 10325 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10338 5600 50  0001 C CNN
F 3 "" H 10300 5750 50  0001 C CNN
	1    10300 5750
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR035
U 1 1 5D897EE2
P 10300 5900
F 0 "#PWR035" H 10300 5650 50  0001 C CNN
F 1 "GND" H 10300 5750 50  0000 C CNN
F 2 "" H 10300 5900 50  0001 C CNN
F 3 "" H 10300 5900 50  0001 C CNN
	1    10300 5900
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R12
U 1 1 5D897EE3
P 6450 3600
F 0 "R12" V 6530 3600 50  0000 C CNN
F 1 "330" V 6450 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 3600 50  0001 C CNN
F 3 "" H 6450 3600 50  0001 C CNN
	1    6450 3600
	0    -1   -1   0   
$EndComp
$Comp
L scuznet-rescue:R-Device R13
U 1 1 5D897EE4
P 6450 3700
F 0 "R13" V 6530 3700 50  0000 C CNN
F 1 "330" V 6450 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6450 3700
	0    1    1    0   
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR036
U 1 1 5D897EE5
P 6800 3950
F 0 "#PWR036" H 6800 3700 50  0001 C CNN
F 1 "GND" H 6800 3800 50  0000 C CNN
F 2 "" H 6800 3950 50  0001 C CNN
F 3 "" H 6800 3950 50  0001 C CNN
	1    6800 3950
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:Crystal-Device Y1
U 1 1 5D897EE6
P 4200 4950
F 0 "Y1" H 4200 5100 50  0000 C CNN
F 1 "25MHz" H 4200 4800 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 4200 4950 50  0001 C CNN
F 3 "" H 4200 4950 50  0001 C CNN
	1    4200 4950
	0    1    1    0   
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR037
U 1 1 5D897EE7
P 4500 5400
F 0 "#PWR037" H 4500 5150 50  0001 C CNN
F 1 "GND" H 4500 5250 50  0000 C CNN
F 2 "" H 4500 5400 50  0001 C CNN
F 3 "" H 4500 5400 50  0001 C CNN
	1    4500 5400
	-1   0    0    -1  
$EndComp
$Comp
L scuznet-rescue:C-Device C40
U 1 1 5D897EE8
P 3750 5200
F 0 "C40" H 3775 5300 50  0000 L CNN
F 1 "27pF" H 3775 5100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 5050 50  0001 C CNN
F 3 "" H 3750 5200 50  0001 C CNN
	1    3750 5200
	0    -1   -1   0   
$EndComp
$Comp
L scuznet-rescue:C-Device C41
U 1 1 5D897EE9
P 3750 4700
F 0 "C41" H 3775 4800 50  0000 L CNN
F 1 "27pF" H 3775 4600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3788 4550 50  0001 C CNN
F 3 "" H 3750 4700 50  0001 C CNN
	1    3750 4700
	0    -1   -1   0   
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR038
U 1 1 5D897EEA
P 3400 5300
F 0 "#PWR038" H 3400 5050 50  0001 C CNN
F 1 "GND" H 3400 5150 50  0000 C CNN
F 2 "" H 3400 5300 50  0001 C CNN
F 3 "" H 3400 5300 50  0001 C CNN
	1    3400 5300
	-1   0    0    -1  
$EndComp
Text Label 4300 3600 0    50   ~ 0
~E_RST
Text Label 3100 1900 0    50   ~ 0
E_MOSI
Text Label 3700 3900 0    50   ~ 0
E_MISO
Text Label 4300 4000 0    50   ~ 0
E_SCK
Text Label 4300 4100 0    50   ~ 0
~E_CS
Text Label 4300 4300 0    50   ~ 0
~E_INT
$Comp
L scuznet-rescue:C-Device C25
U 1 1 5D897EED
P 1400 4250
F 0 "C25" H 1425 4350 50  0000 L CNN
F 1 "100nF" H 1425 4150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1438 4100 50  0001 C CNN
F 3 "" H 1400 4250 50  0001 C CNN
	1    1400 4250
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:C-Device C26
U 1 1 5D897EEE
P 1700 4250
F 0 "C26" H 1725 4350 50  0000 L CNN
F 1 "100nF" H 1725 4150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1738 4100 50  0001 C CNN
F 3 "" H 1700 4250 50  0001 C CNN
	1    1700 4250
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR039
U 1 1 5D897EF0
P 1400 4600
F 0 "#PWR039" H 1400 4350 50  0001 C CNN
F 1 "GND" H 1400 4450 50  0000 C CNN
F 2 "" H 1400 4600 50  0001 C CNN
F 3 "" H 1400 4600 50  0001 C CNN
	1    1400 4600
	1    0    0    -1  
$EndComp
NoConn ~ 11500 4600
$Comp
L scuznet-rescue:VCC-power #PWR040
U 1 1 5D89969B
P 11600 3600
F 0 "#PWR040" H 11600 3450 50  0001 C CNN
F 1 "VCC" H 11600 3750 50  0000 C CNN
F 2 "" H 11600 3600 50  0001 C CNN
F 3 "" H 11600 3600 50  0001 C CNN
	1    11600 3600
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR041
U 1 1 5D899761
P 5300 3150
F 0 "#PWR041" H 5300 3000 50  0001 C CNN
F 1 "VCC" H 5300 3300 50  0000 C CNN
F 2 "" H 5300 3150 50  0001 C CNN
F 3 "" H 5300 3150 50  0001 C CNN
	1    5300 3150
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR042
U 1 1 5D899EB5
P 6200 3400
F 0 "#PWR042" H 6200 3250 50  0001 C CNN
F 1 "VCC" H 6200 3550 50  0000 C CNN
F 2 "" H 6200 3400 50  0001 C CNN
F 3 "" H 6200 3400 50  0001 C CNN
	1    6200 3400
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR043
U 1 1 5D899F74
P 4100 4550
F 0 "#PWR043" H 4100 4400 50  0001 C CNN
F 1 "VCC" H 4100 4700 50  0000 C CNN
F 2 "" H 4100 4550 50  0001 C CNN
F 3 "" H 4100 4550 50  0001 C CNN
	1    4100 4550
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR044
U 1 1 5D89A033
P 1400 3900
F 0 "#PWR044" H 1400 3750 50  0001 C CNN
F 1 "VCC" H 1400 4050 50  0000 C CNN
F 2 "" H 1400 3900 50  0001 C CNN
F 3 "" H 1400 3900 50  0001 C CNN
	1    1400 3900
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R4
U 1 1 5D8D02EA
P 3750 4200
F 0 "R4" V 3830 4200 50  0000 C CNN
F 1 "10K" V 3750 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3680 4200 50  0001 C CNN
F 3 "" H 3750 4200 50  0001 C CNN
	1    3750 4200
	0    1    1    0   
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR063
U 1 1 5D8D9773
P 3500 4100
F 0 "#PWR063" H 3500 3950 50  0001 C CNN
F 1 "VCC" H 3500 4250 50  0000 C CNN
F 2 "" H 3500 4100 50  0001 C CNN
F 3 "" H 3500 4100 50  0001 C CNN
	1    3500 4100
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R3
U 1 1 5D8D9DFA
P 3750 3500
F 0 "R3" V 3830 3500 50  0000 C CNN
F 1 "10K" V 3750 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3680 3500 50  0001 C CNN
F 3 "" H 3750 3500 50  0001 C CNN
	1    3750 3500
	0    1    1    0   
$EndComp
$Comp
L scuznet-rescue:VCC-power #PWR064
U 1 1 5D8D9FD2
P 3500 3400
F 0 "#PWR064" H 3500 3250 50  0001 C CNN
F 1 "VCC" H 3500 3550 50  0000 C CNN
F 2 "" H 3500 3400 50  0001 C CNN
F 3 "" H 3500 3400 50  0001 C CNN
	1    3500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3500 3500 3400
Wire Wire Line
	3600 3500 3500 3500
Connection ~ 4500 3600
Wire Wire Line
	4500 3500 3900 3500
Wire Wire Line
	4500 3600 4500 3500
Wire Wire Line
	3500 4200 3500 4100
Wire Wire Line
	3600 4200 3500 4200
Connection ~ 4500 4100
Wire Wire Line
	4500 4200 3900 4200
Wire Wire Line
	4500 4100 4500 4200
Wire Wire Line
	10100 5500 10300 5500
Connection ~ 1400 4000
Wire Wire Line
	1400 3900 1400 4000
Wire Wire Line
	1700 4000 1700 4100
Connection ~ 1400 4500
Wire Wire Line
	1400 4400 1400 4500
Wire Wire Line
	1700 4500 1700 4400
Wire Wire Line
	4100 4600 4100 4550
Wire Wire Line
	4300 4300 4600 4300
Wire Wire Line
	4300 4100 4500 4100
Wire Wire Line
	4300 4000 4600 4000
Wire Wire Line
	3100 1900 3400 1900
Wire Wire Line
	4300 3600 4500 3600
Connection ~ 3400 5200
Wire Wire Line
	3600 5200 3400 5200
Wire Wire Line
	3400 4700 3400 5200
Wire Wire Line
	3600 4700 3400 4700
Connection ~ 4200 4700
Connection ~ 4200 5200
Wire Wire Line
	4500 5000 4500 5400
Wire Wire Line
	4600 5000 4500 5000
Wire Wire Line
	4200 5200 4200 5100
Wire Wire Line
	3900 5200 4200 5200
Wire Wire Line
	4400 5200 4400 4900
Wire Wire Line
	4400 4900 4600 4900
Wire Wire Line
	4200 4700 4200 4800
Wire Wire Line
	3900 4700 4200 4700
Wire Wire Line
	6300 3700 6000 3700
Wire Wire Line
	6300 3600 6000 3600
Connection ~ 10300 5500
Wire Wire Line
	10300 5400 10300 5500
Wire Wire Line
	10100 5500 10100 5400
Connection ~ 10300 4800
Wire Wire Line
	10300 5100 10300 4800
Connection ~ 10100 5000
Wire Wire Line
	10100 5100 10100 5000
Connection ~ 10600 3700
Wire Wire Line
	10600 3700 10600 3800
Wire Wire Line
	10600 4100 10600 4500
Wire Wire Line
	11600 3700 11600 3600
Wire Wire Line
	11400 3700 11600 3700
Connection ~ 10900 3700
Connection ~ 10300 3700
Wire Wire Line
	10300 3800 10300 3700
Wire Wire Line
	10100 3700 10100 3800
Connection ~ 10300 4400
Wire Wire Line
	10300 4100 10300 4400
Connection ~ 10100 4200
Wire Wire Line
	10100 4100 10100 4200
Wire Wire Line
	13300 5100 13400 5100
Wire Wire Line
	10100 3700 10300 3700
Wire Wire Line
	10900 3700 10900 4300
Wire Wire Line
	10900 4300 11500 4300
Wire Wire Line
	9700 4200 10100 4200
Wire Wire Line
	10900 5000 10900 4700
Wire Wire Line
	10900 4700 11500 4700
Wire Wire Line
	10800 4800 10800 4500
Wire Wire Line
	10800 4500 11500 4500
Wire Wire Line
	9700 4400 10300 4400
Wire Wire Line
	9700 5000 10100 5000
Wire Wire Line
	9700 4800 10300 4800
Wire Wire Line
	6000 4100 6600 4100
Wire Wire Line
	6000 4000 6600 4000
Wire Wire Line
	6200 3900 6000 3900
Connection ~ 6200 3900
Wire Wire Line
	6200 3400 6200 3900
Wire Wire Line
	6200 4400 6000 4400
Connection ~ 6100 4700
Wire Wire Line
	6000 4200 6100 4200
Wire Wire Line
	6100 4200 6100 4700
Wire Wire Line
	6000 4700 6100 4700
Wire Wire Line
	6000 5000 6200 5000
Wire Wire Line
	6200 5200 6200 5300
Wire Wire Line
	6000 5200 6200 5200
Wire Wire Line
	6200 5700 6200 5600
Connection ~ 5300 5550
Wire Wire Line
	5300 5550 5300 5650
Wire Wire Line
	5400 5550 5400 5400
Wire Wire Line
	5200 5550 5300 5550
Wire Wire Line
	5200 5400 5200 5550
Connection ~ 5300 3250
Wire Wire Line
	5300 3250 5300 3150
Wire Wire Line
	5400 3250 5400 3400
Wire Wire Line
	5200 3250 5300 3250
Wire Wire Line
	5200 3400 5200 3250
$Comp
L scuznet-rescue:R-Device R9
U 1 1 5D8C600B
P 4150 3900
F 0 "R9" V 4230 3900 50  0000 C CNN
F 1 "22" V 4150 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4080 3900 50  0001 C CNN
F 3 "" H 4150 3900 50  0001 C CNN
	1    4150 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 3900 4600 3900
Wire Wire Line
	3700 3900 4000 3900
Wire Wire Line
	4500 3600 4600 3600
Wire Wire Line
	4500 4100 4600 4100
Wire Wire Line
	1400 4000 1400 4100
Wire Wire Line
	1400 4000 1700 4000
Wire Wire Line
	1400 4500 1400 4600
Wire Wire Line
	1400 4500 1700 4500
Wire Wire Line
	3400 5200 3400 5300
Wire Wire Line
	4200 4700 4600 4700
Wire Wire Line
	4200 5200 4400 5200
Wire Wire Line
	10300 5500 10300 5600
Wire Wire Line
	10300 4800 10800 4800
Wire Wire Line
	10100 5000 10900 5000
Wire Wire Line
	10600 3700 10900 3700
Wire Wire Line
	10900 3700 11100 3700
Wire Wire Line
	10300 3700 10600 3700
Wire Wire Line
	10300 4400 11500 4400
Wire Wire Line
	10100 4200 11500 4200
Wire Wire Line
	6200 3900 6200 4400
Wire Wire Line
	6100 4700 6100 4750
Wire Wire Line
	5300 5550 5400 5550
Wire Wire Line
	5300 3250 5400 3250
Wire Wire Line
	12400 5400 12400 5500
$Comp
L scuznet-rescue:GND-power #PWR0109
U 1 1 60D2DC9C
P 13400 5200
F 0 "#PWR0109" H 13400 4950 50  0001 C CNN
F 1 "GND" H 13400 5050 50  0000 C CNN
F 2 "" H 13400 5200 50  0001 C CNN
F 3 "" H 13400 5200 50  0001 C CNN
	1    13400 5200
	-1   0    0    -1  
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR0110
U 1 1 60D2F19A
P 12400 5500
F 0 "#PWR0110" H 12400 5250 50  0001 C CNN
F 1 "GND" H 12400 5350 50  0000 C CNN
F 2 "" H 12400 5500 50  0001 C CNN
F 3 "" H 12400 5500 50  0001 C CNN
	1    12400 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	13400 5100 13400 5200
Wire Wire Line
	6600 3600 6600 3300
Wire Wire Line
	6600 3300 7000 3300
Wire Wire Line
	7000 3800 6900 3800
Wire Wire Line
	6900 3800 6900 3950
Connection ~ 6800 3950
Wire Wire Line
	6800 3950 6900 3950
Wire Wire Line
	7000 3400 6800 3400
Wire Wire Line
	6800 3400 6800 3950
Wire Wire Line
	6600 3700 7000 3700
$Comp
L scuznet:Conn_01x02 JLED_A1
U 1 1 648BAD12
P 7200 3300
F 0 "JLED_A1" H 7280 3292 50  0000 L CNN
F 1 "Conn_01x02" H 7280 3201 50  0000 L CNN
F 2 "scuznet:2pin" H 7200 3300 50  0001 C CNN
F 3 "~" H 7200 3300 50  0001 C CNN
	1    7200 3300
	1    0    0    -1  
$EndComp
$Comp
L scuznet:Conn_01x02 JLED_B1
U 1 1 648BED9D
P 7200 3700
F 0 "JLED_B1" H 7280 3692 50  0000 L CNN
F 1 "Conn_01x02" H 7280 3601 50  0000 L CNN
F 2 "scuznet:2pin" H 7200 3700 50  0001 C CNN
F 3 "~" H 7200 3700 50  0001 C CNN
	1    7200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5000 6600 5000
Wire Wire Line
	6600 5000 6600 5100
Wire Wire Line
	6000 4500 6600 4500
Wire Wire Line
	6000 4600 6600 4600
Text Label 6600 4600 2    50   ~ 0
TPOUT-
Text Label 6600 4500 2    50   ~ 0
TPOUT+
$Comp
L scuznet-rescue:GND-power #PWR031
U 1 1 5D897ED6
P 6600 5100
F 0 "#PWR031" H 6600 4850 50  0001 C CNN
F 1 "GND" H 6600 4950 50  0000 C CNN
F 2 "" H 6600 5100 50  0001 C CNN
F 3 "" H 6600 5100 50  0001 C CNN
	1    6600 5100
	1    0    0    -1  
$EndComp
$Comp
L scuznet-rescue:R-Device R10
U 1 1 5D897ED3
P 6350 5000
F 0 "R10" V 6430 5000 50  0000 C CNN
F 1 "2K32" V 6350 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6280 5000 50  0001 C CNN
F 3 "" H 6350 5000 50  0001 C CNN
	1    6350 5000
	0    1    1    0   
$EndComp
Text Label 4300 3800 0    50   ~ 0
E_MOSI
Wire Wire Line
	4300 3800 4600 3800
Text Label 4200 1800 0    50   ~ 0
E_MISO
Wire Wire Line
	3900 1800 4200 1800
Text Label 4200 1900 0    50   ~ 0
E_SCK
Text Label 3100 2000 0    50   ~ 0
~E_CS
Wire Wire Line
	3900 1900 4200 1900
Wire Wire Line
	3100 2000 3400 2000
Text Label 4200 1700 0    50   ~ 0
~E_INT
Wire Wire Line
	3900 1700 4200 1700
Text Label 4200 2000 0    50   ~ 0
~E_RST
Wire Wire Line
	3900 2000 4200 2000
$Comp
L scuznet-rescue:VCC-power #PWR0101
U 1 1 614C60C8
P 3400 2100
F 0 "#PWR0101" H 3400 1950 50  0001 C CNN
F 1 "VCC" H 3400 2250 50  0000 C CNN
F 2 "" H 3400 2100 50  0001 C CNN
F 3 "" H 3400 2100 50  0001 C CNN
	1    3400 2100
	-1   0    0    1   
$EndComp
$Comp
L scuznet-rescue:GND-power #PWR0102
U 1 1 614CCD6B
P 3900 2100
F 0 "#PWR0102" H 3900 1850 50  0001 C CNN
F 1 "GND" H 3900 1950 50  0000 C CNN
F 2 "" H 3900 2100 50  0001 C CNN
F 3 "" H 3900 2100 50  0001 C CNN
	1    3900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4600 4600 4600
$Comp
L scuznet-rescue:ENC28J60x-SO-Interface_Ethernet U8
U 1 1 5D897EF5
P 5300 4400
F 0 "U8" H 4750 5350 50  0000 L CNN
F 1 "ENC28J60-I/SP" H 5500 5350 50  0000 L CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 5300 4400 50  0001 C CIN
F 3 "" H 5300 4400 50  0001 C CNN
	1    5300 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4400 4300 4400
Text Label 4300 4400 0    50   ~ 0
E_WOL
Wire Wire Line
	3400 1800 3100 1800
Text Label 3100 1800 0    50   ~ 0
E_WOL
Wire Wire Line
	4600 5200 4600 5800
Wire Wire Line
	4600 5800 4100 5800
Text Label 4100 5800 0    50   ~ 0
E_CLKOUT
Wire Wire Line
	3400 1700 2900 1700
Text Label 2900 1700 0    50   ~ 0
E_CLKOUT
$Comp
L scuznet:Conn_02x05_Odd_Even_SPI J_SPI1
U 1 1 650FE088
P 3600 1900
F 0 "J_SPI1" H 3650 2317 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even_SPI" H 3650 2226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 3600 1900 50  0001 C CNN
F 3 "~" H 3600 1900 50  0001 C CNN
	1    3600 1900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
