# PieJam OS
This repository contains a `buildroot` based Linux distribution for
the [PieJam](https://github.com/nooploop/piejam) audio mixer application.
It's a minimal Linux system which starts PieJam directly after boot.

## Supported devices

#### SoC
* Raspberry Pi 2B
* Raspberry Pi 3B
* Raspberry Pi 4B
* Raspberry Pi 5B

#### Sound Cards
* All USB ones supported by Linux should work

#### Screen
* Official 7" Raspberry Pi touchscreen
* Official 7" Raspberry Pi touchscreen V2 (only on Pi 4B & 5B)

## Build

#### Raspberry Pi 2B
```
make raspberrypi2
```

#### Raspberry Pi 3B
```
make raspberrypi3
```

#### Raspberry Pi 4B
```
make raspberrypi4
```

#### Raspberry Pi 5B
```
make raspberrypi5
```

## Installation
The build step will create an image, which you need to copy to a microSD card:
```
dd if=br2_external/output/raspberrypi2/images/sdcard.img of=/dev/sdX
```
Replace `/dev/sdX` with the device for your microSD card.