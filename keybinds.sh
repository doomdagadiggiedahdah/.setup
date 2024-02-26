#!/bin/bash
# stolen from https://github.com/thor314/.setup/blob/main/keybinds.sh

MEDIA_KEYS="org.gnome.settings-daemon.plugins.media-keys"
KEYBIND_DIR="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
CUSTOM_BINDS=$(gsettings get "${MEDIA_KEYS}" custom-keybindings)

create_slots() {
    echo "creating $1 slots..." && sleep .2
    keybinds=()
    for i in $(seq 0 $1 ); do
        keybinds+=("${KEYBIND_DIR}/custom${i}/")
    done
    gsettings set "${MEDIA_KEYS}" custom-keybindings "[ $(printf "'%s', " "${keybinds[@]}" | sed 's/, $//') ]"
    echo "done" 
}

set_custom_keybind() {
    local index=$1
    local name=$2
    local command=$3
    local bind=$4

#    if gsettings list-recursively | grep -q "$key_combination"; then
#        echo "Keybinding already set for: $bind"
#    else
	echo "binding $name to $bind..."
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" name "${name}"
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" command "${command}"
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" binding "${bind}"

    #fi
}

run_it() {
    
create_slots 14
set_custom_keybind 1 "gigaChat" "firefox https://chat.openai.com/" "<Super><Shift>O"
set_custom_keybind 2 "toggle Bluetooth Connection" "/home/mat/user-scripts/btPairing.sh" "<Shift><Alt>B"
set_custom_keybind 3 "searchPanel" "/home/mat/Documents/ProgramExperiments/searchPanel/searchPanel" "<Shift><Super>S"
set_custom_keybind 4 "gCal" "firefox https://calendar.google.com/" "<Super>C"
set_custom_keybind 5 "new gDoc" "firefox https://docs.new/" "<Super>D"
set_custom_keybind 6 "open Gmail" "firefox gmail.com" "<Super>G"
set_custom_keybind 7 "fleetNotes" "/home/mat/Documents/ProgramExperiments/fleetingNotes/main/fleetWindow.sh" "<Alt><Ctrl>F"
set_custom_keybind 8 "fact2BEEF" "/home/mat/Documents/ProgramExperiments/fact2cloze/fact2clozeBEEF.sh" "<Alt><Ctrl>C"
set_custom_keybind 9 "ss2text" "/home/mat/Documents/ProgramExperiments/ss2txt/ss.sh" "<Ctrl><Shift>S"
set_custom_keybind 10 "perpSearch" "/home/mat/user-scripts/perplexity.search" "<Alt><Shift>P"
set_custom_keybind 11 "perpSelSearch" "/home/mat/user-scripts/perplexitySel.search" "<Alt><Shift>O"
set_custom_keybind 12 "openLink" "/home/mat/user-scripts/open_run.sh" "<Ctrl><Shift>L"
set_custom_keybind 13 "fb_mess" "firefox https://www.facebook.com/messages/" "<Super>M"
set_custom_keybind 14 "speech2pasteBuff" "/home/mat/Documents/ProgramExperiments/speech2txt_hk/main.sh" "<Alt><Ctrl>R"

}

run_it
