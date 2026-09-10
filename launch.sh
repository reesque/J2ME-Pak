#!/bin/sh

EMU_EXE=freej2me
CORES_PATH=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
export PATH="$CORES_PATH/bin:$CORES_PATH/jre/bin:$PATH"
export LD_LIBRARY_PATH="$CORES_PATH/jre/lib:$CORES_PATH/jre/fclibs:$LD_LIBRARY_PATH"
export HOME="$CORES_PATH/jre"
export JAVA_TOOL_OPTIONS="-Duser.home=$CORES_PATH/jre -Dsun.java2d.fontpath=$CORES_PATH/jre/lib/fonts"
export FONTCONFIG_FILE="$CORES_PATH/jre/lib/fonts.conf"

###############################

chmod +x $CORES_PATH/bin/minui-presenter

show_message() {
    message="$1"
    seconds="$2"

    [ -z "$seconds" ] && seconds="forever"

    killall minui-presenter >/dev/null 2>&1 || true
    echo "$message" 1>&2
    if [ "$seconds" = "forever" ]; then
        minui-presenter --disable-auto-sleep --message "$message" --timeout -1 &
    else
        minui-presenter --disable-auto-sleep --message "$message" --timeout "$seconds"
    fi
}

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM_PATH="$1"
ROM=$(basename "$ROM_PATH")
mkdir -p "$BIOS_PATH/$EMU_TAG"
mkdir -p "$SAVES_PATH/$EMU_TAG"
mkdir -p "$CHEATS_PATH/$EMU_TAG"

show_message "Checking for BIOS..." 3
if [ ! -f "$BIOS_PATH/$EMU_TAG/freej2me.jar" ]; then
    show_message "Copying  BIOS files, please wait..." forever
    
    cp -u "$CORES_PATH/bios/freej2me.jar" "$BIOS_PATH/$EMU_TAG/freej2me.jar"
    cp -u "$CORES_PATH/bios/freej2me-lr.jar" "$BIOS_PATH/$EMU_TAG/freej2me-lr.jar"
    
    show_message "BIOS copy complete!" 3
fi
show_message "Booting $ROM ..." 4

HOME="$USERDATA_PATH"
cd "$HOME"
minarch.elf "$CORES_PATH/${EMU_EXE}_libretro.so" "$ROM_PATH" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1
