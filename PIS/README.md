# NodeMCU_PIS

Plant Irrigation Shield for the NodeMCU_Amica.

## Schematic
[![schematic](docs/NodeMCU_PIS-Schematic.svg)](docs/NodeMCU_PIS-Schematic.pdf)

## Layout
![top](docs/img/PIS-Board_top.svg) ![bottom](docs/img/PIS-Board_bottom.svg)

## Assembling
<img src="IMG_20200221_150840.jpg" width="250" alt="IMG_20200221_150840.jpg"> <img src="IMG_20200221_150518.jpg" width="250" alt="IMG_20200221_150518.jpg">

- Assemble all parts according [BOM](gerbers/PIS_BOM_PIS.csv)
  - there are some slight more variants depending if you want to use an capacetive or resestive soil moisture sensor
  - the status LED is optional
  - the pullup/pulldown resistors should only be placed if needed 
  - leave JP1 open

## Software
you could run [Tasmota](https://github.com/arendst/Tasmota) and set a few configurations

<img src="tasmota_config_pis.png" width="250" alt="tasmota_config_pis.png">

and set some extra parameter in console

```
# set nominal value
mem1 750

# turn pump on/off depending mem value
Rule1 on analog#a0>%mem1% do power1 1 endon on analog#a0<%mem1% do power1 0 endon 

# turn rule1 off when water empty // todo: turn status LED on
Rule2 on Power2#State=0 do Rule1 1 endon on Power2#State=1 do Backlog Rule1 0; Power1 0 endon

Rule1 on
Rule2 on
```

Changing mem1 value (can also be done via MQTT) results in new nominal value, every plant may need other value depending on size, soil, sunlight, ... so you need to play a bit to find a good value. 

