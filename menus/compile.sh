#!/bin/bash
pwd
USER_DIR=$(wslpath "$(env.exe | grep USERPROFILE | cut -d= -f2 | sed $'s/\r//')")
MENU_FILE="${USER_DIR}/Documents/LES/menuconfig.ini"
echo "MENU_FILE=${MENU_FILE}"

# remove existing menu
rm -f "${MENU_FILE}"

# create new menu
{
    printf "/Instruments\n"
        printf "Instrument Rack\nInstrument Rack\n--\n";
        cat "Live Instruments.txt";
    printf "\n\n/Drums\n"
        printf "Drum Rack\nDrum Rack";
        printf "\n--\n";
        cat "Drums.txt";
        cat "Drum Machines.txt";
        printf "\n--\n";
    printf "\nEnd\n";
} >> "${MENU_FILE}"