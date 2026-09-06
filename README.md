# J2ME Emulator Core PAK store repackage

This repo re-packages FreeJ2ME-Plus core into PAK format for PAK store

Main

## Credits

### FreeJ2ME

All credits for the development of the core goes to people at [FreeJ2ME-Plus](https://github.com/TASEmulators/freej2me-plus), which I have included as a submodule for this repository.

*I do not own FreeJ2ME-Plus source code, nor affiliate with maintainers from FreeJ2ME-Plus.*

### Zulu JRE

This repository includes compiled version of Zulu JRE 17.54.21, which was obtained through [Portmaster's runtimes](https://github.com/PortsMaster/PortMaster-New/blob/main/runtimes/zulu17.54.21-ca-jre17.0.13-linux.aarch64.squashfs).

*I do not own Zulu JRE source code and binaries, nor affiliate with Azul Systems.*

## Supported devices

The `so` core is compiled for ARM64 (`aarch64`) only, and can only run on ARM64 devices.

## Installation

- Download `J2ME.pak.zip` from [Releases](https://github.com/reesque/J2ME-Pak/releases)
- Download `BIOS.zip` from [Releases](https://github.com/reesque/J2ME-Pak/releases)
- Extract the content to `Emus/<platform>/` directory of the SD Card
- Extract the content of `BIOS.zip` into `Bios/` directory
- Make sure J2ME `jar` games are located in `Roms/J2ME`
- Reinsert the SD card and boot into NextUI
- It should show up in the main UI