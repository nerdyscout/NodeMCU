EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "NodeMCU_PIS"
Date "2020-03-29"
Rev ""
Comp "https://nerdyscout.github.io/NodeMCU/PIS"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0103
U 1 1 5B6B57C9
P 7150 2600
F 0 "#PWR0103" H 7150 2350 50  0001 C CNN
F 1 "GND" V 7155 2472 50  0000 R CNN
F 2 "" H 7150 2600 50  0001 C CNN
F 3 "" H 7150 2600 50  0001 C CNN
	1    7150 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5B6B57FC
P 7150 2200
F 0 "#PWR0104" H 7150 1950 50  0001 C CNN
F 1 "GND" V 7155 2072 50  0000 R CNN
F 2 "" H 7150 2200 50  0001 C CNN
F 3 "" H 7150 2200 50  0001 C CNN
	1    7150 2200
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5B6B5884
P 9050 1900
F 0 "#PWR0106" H 9050 1650 50  0001 C CNN
F 1 "GND" V 9055 1772 50  0000 R CNN
F 2 "" H 9050 1900 50  0001 C CNN
F 3 "" H 9050 1900 50  0001 C CNN
	1    9050 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9050 1900 8900 1900
Wire Wire Line
	7300 2600 7150 2600
Wire Wire Line
	7300 2200 7150 2200
Wire Wire Line
	7150 2700 7300 2700
$Comp
L Graphic:Logo_Open_Hardware_Small LOGO1
U 1 1 5B6B8279
P 7250 6850
F 0 "LOGO1" H 7250 7236 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 7250 7145 50  0001 C CNN
F 2 "Symbol:OSHW-Symbol_6.7x6mm_SilkScreen" H 7250 7144 50  0001 C CNN
F 3 "~" H 7250 6850 50  0001 C CNN
F 4 "DNP" H 7250 6850 50  0001 C CNN "Variant"
	1    7250 6850
	1    0    0    -1  
$EndComp
Text GLabel 6800 1300 0    50   Input ~ 0
A0
$Comp
L Sensor:DHT11 U4
U 1 1 5B6C95C9
P 3400 2000
F 0 "U4" H 3170 2046 50  0000 R CNN
F 1 "DHT11" H 3170 1955 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 3550 2250 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 3550 2250 50  0001 C CNN
F 4 "DigiKey" H 3400 2000 50  0001 C CNN "Distributor"
F 5 "1528-1228-ND" H 3400 2000 50  0001 C CNN "Part Number"
F 6 "PIS" H 3400 2000 50  0001 C CNN "Variant"
	1    3400 2000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5B6C97CC
P 3400 2750
F 0 "#PWR0122" H 3400 2500 50  0001 C CNN
F 1 "GND" H 3405 2577 50  0000 C CNN
F 2 "" H 3400 2750 50  0001 C CNN
F 3 "" H 3400 2750 50  0001 C CNN
	1    3400 2750
	-1   0    0    -1  
$EndComp
NoConn ~ 7300 2100
NoConn ~ 7300 2000
NoConn ~ 7300 1900
NoConn ~ 7300 1800
NoConn ~ 7300 1500
NoConn ~ 7300 1400
NoConn ~ 7300 2400
NoConn ~ 7300 2500
Text GLabel 2800 2000 0    50   Input ~ 0
DHT
$Comp
L power:+5V #PWR0123
U 1 1 5B81F193
P 3400 1250
F 0 "#PWR0123" H 3400 1100 50  0001 C CNN
F 1 "+5V" V 3400 1400 50  0000 L CNN
F 2 "" H 3400 1250 50  0001 C CNN
F 3 "" H 3400 1250 50  0001 C CNN
	1    3400 1250
	1    0    0    -1  
$EndComp
Text GLabel 9050 1500 2    50   Input ~ 0
DHT
Wire Wire Line
	6800 1300 7300 1300
Text GLabel 10200 2500 2    50   Input ~ 0
TxD
Text GLabel 10200 2400 2    50   Input ~ 0
RxD
Wire Wire Line
	9550 2300 9550 2400
Wire Wire Line
	9650 2300 9650 2500
Wire Wire Line
	8900 2600 9750 2600
Wire Wire Line
	9750 2300 9750 2600
Connection ~ 9750 2600
Wire Wire Line
	9750 2600 10200 2600
Wire Wire Line
	8900 2500 9650 2500
Wire Wire Line
	8900 2400 9550 2400
Connection ~ 9550 2400
Wire Wire Line
	9550 2400 10200 2400
Connection ~ 9650 2500
Wire Wire Line
	9650 2500 10200 2500
$Comp
L Device:R R1
U 1 1 5C2DB014
P 3000 1550
F 0 "R1" H 2750 1600 50  0000 L CNN
F 1 "10k" H 2900 1500 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2930 1550 50  0001 C CNN
F 3 "~" H 3000 1550 50  0001 C CNN
F 4 "PIS" H 3000 1550 50  0001 C CNN "Variant"
	1    3000 1550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5C2DD908
P 3000 1250
F 0 "#PWR0107" H 3000 1100 50  0001 C CNN
F 1 "+5V" V 3000 1400 50  0000 L CNN
F 2 "" H 3000 1250 50  0001 C CNN
F 3 "" H 3000 1250 50  0001 C CNN
	1    3000 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1500 8900 1500
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5C2DFB19
P 7800 4750
F 0 "J1" H 7718 4425 50  0000 C CNN
F 1 "Capacitive Sensor" H 7718 4516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7800 4750 50  0001 C CNN
F 3 "~" H 7800 4750 50  0001 C CNN
F 4 "PIS" H 7800 4750 50  0001 C CNN "Variant"
	1    7800 4750
	-1   0    0    1   
$EndComp
$Comp
L PIS-rescue:NodeMCU1.0(ESP-12E)-ESP8266 U1
U 1 1 5B936524
P 8100 2000
F 0 "U1" H 8100 3050 60  0000 C CNN
F 1 "NodeMCU1.0(ESP-12E)" H 8100 2950 60  0000 C CNN
F 2 "Module:NodeMCU_Amica" H 8100 2981 60  0001 C CNN
F 3 "" H 7500 1150 60  0000 C CNN
	1    8100 2000
	1    0    0    -1  
$EndComp
Text GLabel 8250 4650 2    50   Input ~ 0
A0
Wire Wire Line
	8250 4650 8000 4650
$Comp
L power:GND #PWR0116
U 1 1 5C2ECBE4
P 8150 4850
F 0 "#PWR0116" H 8150 4600 50  0001 C CNN
F 1 "GND" V 8150 4650 50  0000 C CNN
F 2 "" H 8150 4850 50  0001 C CNN
F 3 "" H 8150 4850 50  0001 C CNN
	1    8150 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0117
U 1 1 5C2EE536
P 8150 4750
F 0 "#PWR0117" H 8150 4600 50  0001 C CNN
F 1 "+5V" V 8150 4950 50  0000 C CNN
F 2 "" H 8150 4750 50  0001 C CNN
F 3 "" H 8150 4750 50  0001 C CNN
	1    8150 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 4750 8000 4750
Wire Wire Line
	3000 1250 3000 1400
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5BEE6FAC
P 9750 2100
F 0 "J3" V 9714 2280 50  0000 L CNN
F 1 "Serial" V 9623 2280 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9750 2100 50  0001 C CNN
F 3 "~" H 9750 2100 50  0001 C CNN
	1    9750 2100
	0    1    -1   0   
$EndComp
Wire Wire Line
	10250 2300 9850 2300
$Comp
L Transistor_BJT:BC547 Q3
U 1 1 5C3B966C
P 3300 5500
F 0 "Q3" H 3491 5546 50  0000 L CNN
F 1 "BC547" H 3491 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3500 5425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 3300 5500 50  0001 L CNN
F 4 "DigiKey" H 3300 5500 50  0001 C CNN "Distributor"
F 5 "BC547-ND" H 3300 5500 50  0001 C CNN "Part Number"
F 6 "PIS" H 3300 5500 50  0001 C CNN "Variant"
	1    3300 5500
	1    0    0    -1  
$EndComp
Text GLabel 2900 5500 0    50   Input ~ 0
Relay
$Comp
L power:+5V #PWR0114
U 1 1 5C3B9677
P 3400 4100
F 0 "#PWR0114" H 3400 3950 50  0001 C CNN
F 1 "+5V" H 3415 4273 50  0000 C CNN
F 2 "" H 3400 4100 50  0001 C CNN
F 3 "" H 3400 4100 50  0001 C CNN
	1    3400 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5C3B9681
P 3400 5900
F 0 "#PWR0120" H 3400 5650 50  0001 C CNN
F 1 "GND" H 3405 5727 50  0000 C CNN
F 2 "" H 3400 5900 50  0001 C CNN
F 3 "" H 3400 5900 50  0001 C CNN
	1    3400 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5C3C07E2
P 5050 2000
F 0 "J2" H 4968 1675 50  0000 C CNN
F 1 "Conn_01x03" H 4968 1766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5050 2000 50  0001 C CNN
F 3 "~" H 5050 2000 50  0001 C CNN
F 4 "PIS" H 5050 2000 50  0001 C CNN "Variant"
	1    5050 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5C3C1672
P 5750 1600
F 0 "R2" H 5500 1650 50  0000 L CNN
F 1 "10k" H 5650 1550 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5680 1600 50  0001 C CNN
F 3 "~" H 5750 1600 50  0001 C CNN
F 4 "PIS" H 5750 1600 50  0001 C CNN "Variant"
	1    5750 1600
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5C3C2F75
P 5750 2400
F 0 "R3" H 5500 2450 50  0000 L CNN
F 1 "10k" H 5650 2350 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5680 2400 50  0001 C CNN
F 3 "~" H 5750 2400 50  0001 C CNN
F 4 "PIS" H 5750 2400 50  0001 C CNN "Variant"
	1    5750 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 2000 5750 2000
Wire Wire Line
	5750 2000 5750 2250
Wire Wire Line
	5750 1750 5750 2000
Connection ~ 5750 2000
$Comp
L power:+5V #PWR0125
U 1 1 5C3C6992
P 7150 2700
F 0 "#PWR0125" H 7150 2550 50  0001 C CNN
F 1 "+5V" V 7150 2850 50  0000 L CNN
F 2 "" H 7150 2700 50  0001 C CNN
F 3 "" H 7150 2700 50  0001 C CNN
	1    7150 2700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0126
U 1 1 5C3C783A
P 10250 2300
F 0 "#PWR0126" H 10250 2150 50  0001 C CNN
F 1 "+5V" V 10250 2450 50  0000 L CNN
F 2 "" H 10250 2300 50  0001 C CNN
F 3 "" H 10250 2300 50  0001 C CNN
	1    10250 2300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 5C3C82E8
P 5500 1250
F 0 "#PWR0127" H 5500 1100 50  0001 C CNN
F 1 "+5V" V 5500 1400 50  0000 L CNN
F 2 "" H 5500 1250 50  0001 C CNN
F 3 "" H 5500 1250 50  0001 C CNN
	1    5500 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0128
U 1 1 5C3C91E4
P 5750 1250
F 0 "#PWR0128" H 5750 1100 50  0001 C CNN
F 1 "+5V" V 5750 1400 50  0000 L CNN
F 2 "" H 5750 1250 50  0001 C CNN
F 3 "" H 5750 1250 50  0001 C CNN
	1    5750 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 1250 5500 1900
Wire Wire Line
	5500 1900 5250 1900
Wire Wire Line
	5750 1250 5750 1450
$Comp
L power:GND #PWR0129
U 1 1 5C3CCFDA
P 5750 2750
F 0 "#PWR0129" H 5750 2500 50  0001 C CNN
F 1 "GND" H 5755 2577 50  0000 C CNN
F 2 "" H 5750 2750 50  0001 C CNN
F 3 "" H 5750 2750 50  0001 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5C3CD689
P 5500 2750
F 0 "#PWR0130" H 5500 2500 50  0001 C CNN
F 1 "GND" H 5505 2577 50  0000 C CNN
F 2 "" H 5500 2750 50  0001 C CNN
F 3 "" H 5500 2750 50  0001 C CNN
	1    5500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2750 5500 2100
Wire Wire Line
	5500 2100 5250 2100
Wire Wire Line
	5750 2750 5750 2550
Text GLabel 6000 2000 2    50   Input ~ 0
Contact
Wire Wire Line
	6000 2000 5750 2000
$Comp
L Relay:G5V-1 K1
U 1 1 5C3D1A7F
P 4150 4700
F 0 "K1" H 4580 4746 50  0000 L CNN
F 1 "G5V-1" H 4580 4655 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_Omron_G5V-1" H 5280 4670 50  0001 C CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_1.pdf" H 4150 4700 50  0001 C CNN
F 4 "PIS" H 4150 4700 50  0001 C CNN "Variant"
	1    4150 4700
	1    0    0    1   
$EndComp
$Comp
L Diode:1N4148 D1
U 1 1 5C3DA005
P 3400 4750
F 0 "D1" V 3354 4829 50  0000 L CNN
F 1 "1N4148" V 3445 4829 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3400 4575 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/1N4148_1N4448.pdf" H 3400 4750 50  0001 C CNN
F 4 "PIS" H 3400 4750 50  0001 C CNN "Variant"
	1    3400 4750
	0    -1   1    0   
$EndComp
$Comp
L Graphic:Logo_Open_Hardware_Small LOGO2
U 1 1 5C3F045C
P 7250 6850
F 0 "LOGO2" H 7250 7236 50  0001 C CNN
F 1 "Logo_Open_Hardware_Small" H 7250 7145 50  0001 C CNN
F 2 "Symbol:KiCad-Logo_6mm_SilkScreen" H 7250 7144 50  0001 C CNN
F 3 "~" H 7250 6850 50  0001 C CNN
F 4 "DNP" H 7250 6850 50  0001 C CNN "Variant"
	1    7250 6850
	1    0    0    -1  
$EndComp
NoConn ~ 7300 1600
NoConn ~ 7300 1700
$Comp
L power:+5V #PWR0113
U 1 1 5C433ED2
P 2000 4100
F 0 "#PWR0113" H 2000 3950 50  0001 C CNN
F 1 "+5V" H 2015 4273 50  0000 C CNN
F 2 "" H 2000 4100 50  0001 C CNN
F 3 "" H 2000 4100 50  0001 C CNN
	1    2000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5C433EDC
P 2000 5900
F 0 "#PWR0115" H 2000 5650 50  0001 C CNN
F 1 "GND" H 2005 5727 50  0000 C CNN
F 2 "" H 2000 5900 50  0001 C CNN
F 3 "" H 2000 5900 50  0001 C CNN
	1    2000 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5C43D8A7
P 2000 4500
F 0 "D2" V 2039 4383 50  0000 R CNN
F 1 "LED" V 1948 4383 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2000 4500 50  0001 C CNN
F 3 "~" H 2000 4500 50  0001 C CNN
F 4 "PIS, IR" H 2000 4500 50  0001 C CNN "Variant"
	1    2000 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 5500 1700 5500
Text GLabel 1500 5500 0    50   Input ~ 0
LED
$Comp
L Transistor_BJT:BC547 Q1
U 1 1 5C433EC8
P 1900 5500
F 0 "Q1" H 2091 5546 50  0000 L CNN
F 1 "BC547" H 2091 5455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2100 5425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 1900 5500 50  0001 L CNN
F 4 "DigiKey" H 1900 5500 50  0001 C CNN "Distributor"
F 5 "BC547-ND" H 1900 5500 50  0001 C CNN "Part Number"
F 6 "PIS, IR" H 1900 5500 50  0001 C CNN "Variant"
	1    1900 5500
	1    0    0    -1  
$EndComp
Text GLabel 9050 1600 2    50   Input ~ 0
LED
$Comp
L power:GND #PWR0112
U 1 1 5B9BCBAD
P 10200 2600
F 0 "#PWR0112" H 10200 2350 50  0001 C CNN
F 1 "GND" V 10205 2472 50  0000 R CNN
F 2 "" H 10200 2600 50  0001 C CNN
F 3 "" H 10200 2600 50  0001 C CNN
	1    10200 2600
	0    -1   -1   0   
$EndComp
Text GLabel 9050 1400 2    50   Input ~ 0
Relay
$Comp
L Connector:TestPoint TP1
U 1 1 5C43EF54
P 8900 2000
F 0 "TP1" V 8854 2188 50  0001 L CNN
F 1 "CLK" V 8900 2188 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9100 2000 50  0001 C CNN
F 3 "~" H 9100 2000 50  0001 C CNN
	1    8900 2000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C43F40A
P 8900 2100
F 0 "TP2" V 8854 2288 50  0001 L CNN
F 1 "MISO" V 8900 2288 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9100 2100 50  0001 C CNN
F 3 "~" H 9100 2100 50  0001 C CNN
	1    8900 2100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C43F537
P 8900 2200
F 0 "TP3" V 8854 2388 50  0001 L CNN
F 1 "MOSI" V 8900 2388 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9100 2200 50  0001 C CNN
F 3 "~" H 9100 2200 50  0001 C CNN
	1    8900 2200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5C43F79F
P 8900 2300
F 0 "TP4" V 8854 2488 50  0001 L CNN
F 1 "CS" V 8900 2488 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 9100 2300 50  0001 C CNN
F 3 "~" H 9100 2300 50  0001 C CNN
	1    8900 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5C445201
P 2000 5000
F 0 "R4" H 1800 4950 50  0000 L CNN
F 1 "100" H 1900 5050 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1930 5000 50  0001 C CNN
F 3 "~" H 2000 5000 50  0001 C CNN
F 4 "PIS, IR" H 2000 5000 50  0001 C CNN "Variant"
	1    2000 5000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 4100 2000 4350
Wire Wire Line
	2000 4650 2000 4850
Wire Wire Line
	2000 5150 2000 5300
$Comp
L Connector:Screw_Terminal_01x04 J4
U 1 1 5C455A67
P 5700 4800
F 0 "J4" H 5700 4500 50  0000 C CNN
F 1 "Screw_Terminal_01x04" V 5850 4800 50  0001 C CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-4_1x04_P2.54mm_Horizontal" H 5700 4800 50  0001 C CNN
F 3 "~" H 5700 4800 50  0001 C CNN
F 4 "PIS" H 5700 4800 50  0001 C CNN "Variant"
	1    5700 4800
	1    0    0    1   
$EndComp
Wire Wire Line
	3400 4100 3400 4300
Wire Wire Line
	3950 4300 3400 4300
Connection ~ 3400 4300
Wire Wire Line
	3400 4300 3400 4600
Wire Wire Line
	3400 5900 3400 5700
Wire Wire Line
	4900 4300 4350 4300
$Comp
L power:GND #PWR0101
U 1 1 5C46C651
P 5350 5500
F 0 "#PWR0101" H 5350 5250 50  0001 C CNN
F 1 "GND" H 5355 5327 50  0000 C CNN
F 2 "" H 5350 5500 50  0001 C CNN
F 3 "" H 5350 5500 50  0001 C CNN
	1    5350 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1600 8900 1600
Text GLabel 9050 1700 2    50   Input ~ 0
Contact
NoConn ~ 8900 1800
NoConn ~ 8900 2700
Wire Wire Line
	9050 1400 8900 1400
Wire Wire Line
	9050 1700 8900 1700
Text Notes 9500 1325 0    50   ~ 0
LED NodeMCU
Text Notes 9500 1725 0    50   ~ 0
LED ESP12
Wire Wire Line
	2800 2000 3000 2000
Wire Wire Line
	3400 1250 3400 1700
Wire Wire Line
	3000 1700 3000 2000
Connection ~ 3000 2000
Wire Wire Line
	3000 2000 3100 2000
Wire Wire Line
	3400 2300 3400 2750
Wire Wire Line
	2000 5900 2000 5700
Wire Wire Line
	8150 4850 8000 4850
Text GLabel 9750 4650 2    50   Input ~ 0
A0
Wire Wire Line
	9750 4650 9500 4650
$Comp
L power:GND #PWR0105
U 1 1 5C4C4B9E
P 9650 4850
F 0 "#PWR0105" H 9650 4600 50  0001 C CNN
F 1 "GND" V 9650 4650 50  0000 C CNN
F 2 "" H 9650 4850 50  0001 C CNN
F 3 "" H 9650 4850 50  0001 C CNN
	1    9650 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5C4C4BA8
P 9650 4950
F 0 "#PWR0108" H 9650 4800 50  0001 C CNN
F 1 "+5V" V 9650 5150 50  0000 C CNN
F 2 "" H 9650 4950 50  0001 C CNN
F 3 "" H 9650 4950 50  0001 C CNN
	1    9650 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 4950 9500 4950
Wire Wire Line
	9650 4850 9500 4850
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 5C4C85C5
P 9300 4850
F 0 "J5" H 9218 4425 50  0000 C CNN
F 1 "Resistive Sensor" H 9218 4516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9300 4850 50  0001 C CNN
F 3 "~" H 9300 4850 50  0001 C CNN
F 4 "PIS" H 9300 4850 50  0001 C CNN "Variant"
	1    9300 4850
	-1   0    0    1   
$EndComp
Text GLabel 9050 1300 2    50   Input ~ 0
Dig
Wire Wire Line
	9050 1300 8900 1300
Text GLabel 9750 4750 2    50   Input ~ 0
Dig
Wire Wire Line
	9750 4750 9500 4750
$Comp
L Interface_Optical:TSOP17xx U2
U 1 1 5C55B23F
P 5800 7000
F 0 "U2" H 5788 7425 50  0000 C CNN
F 1 "TSOP17xx" H 5788 7334 50  0000 C CNN
F 2 "OptoDevice:Vishay_CAST-3Pin" H 5750 6625 50  0001 C CNN
F 3 "http://www.micropik.com/PDF/tsop17xx.pdf" H 6450 7300 50  0001 C CNN
F 4 "IR" H 5800 7000 50  0001 C CNN "Variant"
	1    5800 7000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C55C2F2
P 5350 7450
F 0 "#PWR0109" H 5350 7200 50  0001 C CNN
F 1 "GND" H 5355 7277 50  0000 C CNN
F 2 "" H 5350 7450 50  0001 C CNN
F 3 "" H 5350 7450 50  0001 C CNN
	1    5350 7450
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5C55CAF0
P 5350 6550
F 0 "#PWR0110" H 5350 6400 50  0001 C CNN
F 1 "+5V" H 5365 6723 50  0000 C CNN
F 2 "" H 5350 6550 50  0001 C CNN
F 3 "" H 5350 6550 50  0001 C CNN
	1    5350 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 4600 4900 4300
Wire Wire Line
	5500 4700 5250 4700
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5C56F029
P 4150 7000
F 0 "JP1" H 4150 7235 50  0000 C CNN
F 1 "Jumper_2_Open" H 4150 7144 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 4150 7000 50  0001 C CNN
F 3 "~" H 4150 7000 50  0001 C CNN
F 4 "DNP" H 4150 7000 50  0001 C CNN "Variant"
	1    4150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6800 5350 6800
Wire Wire Line
	5350 6800 5350 6550
Wire Wire Line
	5350 7450 5350 7200
Wire Wire Line
	5350 7200 5400 7200
Wire Wire Line
	5350 4100 5350 4800
$Comp
L power:+5V #PWR0102
U 1 1 5C46E285
P 5350 4100
F 0 "#PWR0102" H 5350 3950 50  0001 C CNN
F 1 "+5V" H 5365 4273 50  0000 C CNN
F 2 "" H 5350 4100 50  0001 C CNN
F 3 "" H 5350 4100 50  0001 C CNN
	1    5350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4800 5500 4800
Wire Wire Line
	5350 4900 5500 4900
Wire Wire Line
	5350 5500 5350 4900
Wire Wire Line
	5250 4700 5250 5200
Wire Wire Line
	4450 5200 5250 5200
Wire Wire Line
	4350 7000 4900 7000
Wire Wire Line
	4900 4600 5500 4600
Wire Wire Line
	3000 7000 3950 7000
Connection ~ 4900 7000
Wire Wire Line
	4900 7000 5400 7000
Wire Wire Line
	3400 4900 3400 5200
Wire Wire Line
	3950 5000 3950 5200
Wire Wire Line
	3950 5200 3400 5200
Connection ~ 3400 5200
Wire Wire Line
	3400 5200 3400 5300
Wire Wire Line
	3950 4400 3950 4300
Wire Wire Line
	4350 4400 4350 4300
Wire Wire Line
	4450 5000 4450 5200
Wire Notes Line
	2500 6250 6750 6250
Wire Wire Line
	2900 5500 3000 5500
Wire Wire Line
	3000 5500 3000 7000
Connection ~ 3000 5500
Wire Wire Line
	3000 5500 3100 5500
Wire Wire Line
	4900 4600 4900 7000
Connection ~ 4900 4600
Text Notes 5750 6200 0    50   ~ 0
PLANT
Text Notes 6250 6375 0    50   ~ 0
MQTT
Text Notes 4375 2075 0    50   ~ 0
use to detect \nwater level
$Comp
L Motor:Motor_DC #M?
U 1 1 5E81B505
P 6325 4700
F 0 "#M?" H 6150 4700 50  0001 R CNN
F 1 "Motor_DC" H 6150 4650 50  0001 R CNN
F 2 "" H 6325 4610 50  0001 C CNN
F 3 "~" H 6325 4610 50  0001 C CNN
F 4 "PLANT" H 6325 4700 50  0001 C CNN "Variant"
	1    6325 4700
	1    0    0    -1  
$EndComp
Wire Notes Line style solid
	6325 5000 6000 5000
Wire Notes Line style solid
	6000 5000 6000 4900
Wire Notes Line style solid
	6000 4900 5775 4900
Wire Notes Line style solid
	5775 4600 6000 4600
Wire Notes Line style solid
	6000 4600 6000 4500
Wire Notes Line style solid
	6000 4500 6325 4500
Wire Notes Line style solid
	5775 4800 5875 4800
Wire Notes Line style solid
	5875 4800 5875 4700
Wire Notes Line style solid
	5875 4700 5775 4700
$EndSCHEMATC
