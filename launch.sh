#!/bin/sh

EMU_EXE=freej2me
CORES_PATH=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
export PATH="$CORES_PATH/jre/bin:$PATH"
export LD_LIBRARY_PATH="$CORES_PATH/jre/lib:$CORES_PATH/jre/fclibs:$LD_LIBRARY_PATH"
export HOME="$CORES_PATH/jre"
export JAVA_TOOL_OPTIONS="-Duser.home=$CORES_PATH/jre -Dsun.java2d.fontpath=$CORES_PATH/jre/lib/fonts"
export FONTCONFIG_FILE="$CORES_PATH/jre/lib/fonts.conf"

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
mkdir -p "$BIOS_PATH/$EMU_TAG"
mkdir -p "$SAVES_PATH/$EMU_TAG"
mkdir -p "$CHEATS_PATH/$EMU_TAG"
HOME="$USERDATA_PATH"
cd "$HOME"
minarch.elf "$CORES_PATH/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1
