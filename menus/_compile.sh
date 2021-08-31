#!/bin/bash
USER_DIR=$(wslpath "$(env.exe | grep USERPROFILE | cut -d= -f2 | sed $'s/\r//')")
MENU_FILE="${USER_DIR}/Documents/LES/menuconfig.ini"
echo "MENU_FILE=${MENU_FILE}"

# remove existing menu (we re-create it every time)
rm -f "${MENU_FILE}"

# create new menu
{
                                                                        # MENU SIMULATION

    printf "/Instruments\n"                                             # Instruments
        printf "Instrument Rack\nInstrument Rack\n--\n";                #    Instrument Rack
        printf "\n--\n";                                                #    --
        cat "Instruments - Ableton.txt";                                #    Ableton Instruments
        printf "\n--\n";                                                #    --
        cat "Instruments - User.txt";                                   #    User Instruments

    printf "\n\n/Drums\n"                                               # Drums
        printf "Drum Rack\nDrum Rack\n--\n";                            #    Drum Rack
        printf "\n--\n";                                                #    --
        cat "Drums - Ableton.txt";                                      #    Ableton Drums
        printf "\n--\n";                                                #    --
        cat "Drums - User.txt";                                         #    User Drums

    printf "\n\nMIDI Effects\n";                                        # MIDI Effects
        printf "MIDI Effect Rack\nMIDI Effect Rack\n--\n";              #    MIDI Effect Rack
        printf "\n--\n";                                                #    --
        cat "MIDI Effects - Ableton.txt";                               #    Ableton MIDI Effects
        printf "\n--\n";                                                #    --
        cat "MIDI Effects - User.txt";                                  #    User MIDI Effects

    printf "\n\nAudio Effects\n";                                       # Audio Effects
        printf "Audio Effect Rack\nAudio Effect Rack\n--\n";            #     Audio Effect Rack
        printf "\n--\n";                                                #     --
        cat "Audio Effects - Ableton.txt";                              #     Ableton Audio Effects
        printf "\n--\n";                                                #     --
        cat "Audio Effects - User.txt";                                 #     User Audio Effects

    printf "\nEnd\n";                                                   # End marker - REQUIRED!

} >> "${MENU_FILE}"

# copy generated menu file into repo for backup
cp "${MENU_FILE}" "$(dirname "${0}")/MENU.txt"