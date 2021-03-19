# PieJam OS
This repository contains a `buildroot` based Linux distribution for
the [PieJam](https://github.com/nooploop/piejam) audio mixer application.
It's a minimal Linux system which starts PieJam directly after boot.

## Supported devices

#### SoC
* Raspberry Pi 2B
* Raspberry Pi 3B

#### Sound Cards
* All USB ones should work

#### Screen
* Only the official 7" Raspberry Pi touchscreen

## Build

#### Raspberry Pi 2B
```
make raspberrypi2
```

#### Raspberry Pi 3B
```
make raspberrypi3
```

## Installation
The build step will create an image, which you need to copy to a microSD card:
```
dd if=br2_external/output/raspberrypi2/images/sdcard.img of=/dev/sdX
```
Replace `/dev/sdX` with the device for your microSD card.