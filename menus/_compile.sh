#!/bin/bash
USER_DIR=$(wslpath "$(env.exe | grep USERPROFILE | cut -d= -f2 | sed $'s/\r//')")
MENU_FILE="${USER_DIR}/Documents/LES/menuconfig.ini"
#echo "MENU_FILE=${MENU_FILE}"

# remove existing menu (we re-create it every time)
rm -f "${MENU_FILE}"

# create new menu
{
                                                                        # MENU SIMULATION

    printf "/Favorites";                                                # Favorites {
        printf "\n";                                                    #
        cat "Favorites.txt";                                            #    Favorites
        printf "\n..";                                                  # }
        printf "\n--\n";                                                # --

    printf "/Reason";                                                   # Reason {
        printf "\nCombinator\nCombinator";                              #
        printf "\n--\n";                                                # --
        cat "Reason - Instruments.txt";                                 #    Reason Instruments
        printf "\n";                                                    #
        cat "Reason - Effects.txt";                                     #    Reason Audio Effects
        printf "\n";                                                    #
        cat "Reason - Players.txt";                                     #    Reason Players
        printf "\n..";                                                  # }
        printf "\n--\n";                                                # --

    printf "/Reaktor";                                                  # Reaktor {
        printf "\nReaktor\nReaktor";                                    #    Reaktor
        printf "\nReaktor FX\nReaktor FX";                              #    Reaktor
        printf "\n--\n";                                                # --
        cat "Reaktor - Instruments.txt";                                #    Reaktor Instruments
        printf "\n";                                                    #
        cat "Reaktor - Audio Effects.txt";                              #    Reaktor Audio Effects
        printf "\n";                                                    #
        cat "Reaktor - MIDI Effects.txt";                               #    Reaktor MIDI Effects
        printf "\n..";                                                  # }
        printf "\n--\n";                                                # --

    printf "/Instruments";                                              # Instruments {
        printf "\nInstrument Rack\nInstrument Rack";                    #    Instrument Rack
        printf "\n--\n";                                                #    --
        cat "Instruments - Ableton.txt";                                #    Ableton Instruments
        printf "\n--\n";                                                #    --
        cat "Instruments - User.txt";                                   #    User Instruments
        printf "\n..\n";                                                # }

    printf "/Drums";                                                    # Drums {
        printf "\nDrum Rack\nDrum Rack\n";                              #    Drum Rack
        cat "Drums - Ableton.txt";                                      #    Ableton Drums
        printf "\n--\n";                                                #    --
        cat "Drums - User.txt";                                         #    User Drums
        printf "\n..\n";                                                # }

    printf "/Audio Effects";                                            # Audio Effects {
        printf "\nAudio Effect Rack\nAudio Effect Rack";                #    Audio Effect Rack
        printf "\n--\n";                                                #    --
        cat "Audio Effects - Ableton.txt";                              #    Ableton Audio Effects
        printf "\n--\n";                                                #    --
        cat "Audio Effects - User.txt";                                 #    User Audio Effects
        printf "\n..\n";                                                # }

    printf "/Modulators";                                               # Modulators {
        printf "\n";                                                    #
        cat "Modulators - Ableton.txt";                                 #    Ableton Modulators
        printf "\n--\n";                                                #    --
        cat "Modulators - User.txt";                                    #    User Modulators
        printf "\n..\n";                                                # }

    printf "/MIDI Effects";                                             # MIDI Effects {
        printf "\nMIDI Effect Rack\nMIDI Effect Rack";                  #    MIDI Effect Rack
        printf "\n--\n";                                                #    --
        cat "MIDI Effects - Ableton.txt";                               #    Ableton MIDI Effects
        printf "\n--\n";                                                #    --
        cat "MIDI Effects - User.txt";                                  #    User MIDI Effects
        printf "\n..\n";                                                # }

    printf "\n--\n";                                                    # --
    printf "\nDrum Rack\nDrum Rack";                                    # Drum Rack
    printf "\nInstrument Rack\nInstrument Rack";                        # Instrument Rack
    printf "\nAudio Effect Rack\nAudio Effect Rack";                    # Audio Effect Rack
    printf "\nMIDI Effect Rack\nMIDI Effect Rack";                      # MIDI Effect Rack
    printf "\n--\n";                                                    # --
    printf "\nExternal Instrument\nExternal Instrument";                # External Instrument
    printf "\nExternal Audio Effect\nExternal Audio Effect"             # External Audio Effect
    printf "\n--\n";                                                    # --
    printf "\nMax Instrument\nMax Instrument";                          # Max Instrument
    printf "\nMax Audio Effect\nMax Audio Effect";                      # Max Audio Effect
    printf "\nMax MIDI Effect\nMax MIDI Effect";                        # Max MIDI Effect
    printf "\n--\n";                                                    # --
    printf "\nCV Instrument\nCV Instrument";                            # CV Instrument
    printf "\nCV In\nCV In";                                            # CV In
    printf "\nCV Out\nCV Out";                                          # CV Out
    printf "\nCV Clock In\nCV Clock In";                                # CV Clock In
    printf "\nCV Clock Out\nCV Clock Out";                              # CV Clock Out
    printf "\nCV Triggers\nCV Triggers";                                # CV Triggers
    printf "\nCV Envelope Follower\nCV Envelope Follower";              # CV Envelope Follower
    printf "\nCV LFO\nCV LFO";                                          # CV LFO
    printf "\nCV Shaper\nCV Shaper";                                    # CV Shaper
    printf "\nCV Utility\nCV Utility";                                  # CV Utility

    printf "\n--\n"                                                     # --
    printf "\nWAVE CANDY METERING\n+GJ Wave Candy - METERING.adg"       # WAVE CANDY METERING
    printf "\nEnd\n";                                                   # End marker - REQUIRED!

} >> "${MENU_FILE}"

# copy generated menu file into repo for backup
cp "${MENU_FILE}" "$(dirname "${0}")/MENU.txt"