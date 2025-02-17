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
    echo "slots done" 
}

set_custom_keybind() {
    local index=$1
    local name=$2
    local command=$3
    local bind=$4

	echo "binding $name to $bind..."
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" name "${name}"
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" command "${command}"
    gsettings set "${MEDIA_KEYS}.custom-keybinding:${KEYBIND_DIR}/custom${index}/" binding "${bind}"

    #fi
}

run_it() {
    create_slots 50
    prgm_repo="/home/mat/Documents/ProgramExperiments"
    hotkey_repo="$prgm_repo/.setup/hotkeys"
    sanity="python $hotkey_repo/sanity.py"

    always_produce_link="https://docs.google.com/document/d/1_UXIxwMgg-RK79POgb7FQQQjb0CJbbKejt9iff1rhFw/edit"
    mat_futures="https://docs.google.com/document/d/1ZXz8kJIjnlPtkrub37TRF6U-DyT-34QOk1oyvxERl0k/edit?tab=t.0"

    bm_moc="https://docs.google.com/document/d/1bDyEoaQfdAqwGX_7u5Fi0FSKYEYu6MDowCbHh3Z9N4c/edit"
    meta_models="https://docs.google.com/document/d/1N8eVUfznCSMVDWTFFRPgGXO_lPHX2VkGy8AjXCUxSwA/edit"
    simple_stories="https://docs.google.com/document/d/1Xu0qdmn5GspPgdk7USjM30rRzHb06PK8ejsGVuYAiME/edit"
    csp_moc="https://hackmd.io/cJGD336CTIKO5x3xZmxftQ"

    ## comms
    set_custom_keybind 1  "open FB Msgr"       "firefox https://www.facebook.com/messages/"                "<Super>F"
    set_custom_keybind 2  "open sms msgr"      "firefox https://messages.google.com/web/conversations"     "<Super><Alt>X"
    set_custom_keybind 3  "open Gmail"         "firefox https://mail.google.com/mail/u/0/"                 "<Super>G"
    set_custom_keybind 4  "fb_mess"            "firefox https://www.facebook.com/messages/"                "<Super>M"
    set_custom_keybind 5  "linkedin"           "firefox https://www.linkedin.com/feed/"                    "<Super><Alt>L"

    ## search / info
    set_custom_keybind 10  "ChattyG"           "firefox https://chatgpt.com/?model=gpt-4o"                 "<Super><Shift>O"
    set_custom_keybind 11  "ClaudeBae"         "firefox https://claude.ai/chats"                           "<Super><Shift>A"
    set_custom_keybind 12  "searchPanel"       "$prgm_repo/searchPanel/searchPanel"                        "<Super><Shift>S"
    set_custom_keybind 13  "gCal"              "firefox https://calendar.google.com/"                      "<Super>C"
    set_custom_keybind 14  "new gDoc"          "firefox https://docs.new/"                                 "<Super><Shift>D"
    set_custom_keybind 15  "openLink"          "$prgm_repo/.setup/hotkeys/open_run.sh"                     "<Ctrl><Shift>L"
    set_custom_keybind 16  "quote"             "python3 $prgm_repo/.setup/hotkeys/quote.py"                "<Ctrl><Shift>U"

    ## web services
    set_custom_keybind 20  "fact2BEEF"         "$prgm_repo/fact2cloze/fact2clozeBEEF.sh"                   "<Ctrl><Alt>C"
    set_custom_keybind 21  "ss2text"           "$prgm_repo/ss2txt/ss.sh"                                   "<Ctrl><Shift>S"
    set_custom_keybind 22  "perpSearch"        "$prgm_repo/.setup/hotkeys/perplexity.search"               "<Alt><Shift>P"
    set_custom_keybind 23  "perpSelSearch"     "$prgm_repo/.setup/hotkeys/perplexitySel.search"            "<Alt><Shift>O"
    set_custom_keybind 24  "STTpb"             "$prgm_repo/stt_hk/main.sh"                                 "<Ctrl><Alt>R"
    set_custom_keybind 25  "open maps"         "$prgm_repo/.setup/hotkeys/open_maps.sh"                    "<Super><Alt>M"
    set_custom_keybind 26  "open partiful"     "firefox https://partiful.com/events"                       "<Super><Alt>P"
    set_custom_keybind 27  "aquatic ambi"      "firefox https://www.youtube.com/watch?v=CKAc3nYEatw"       "<Super><Shift>Q"
    set_custom_keybind 28  "2048"              "firefox https://play2048.co/"                              "<Ctrl><Shift>2"
    set_custom_keybind 29  "yoga"              "firefox https://www.bodytempyoga.com/schedule"             "<Ctrl><Shift>B"

    set_custom_keybind 30  "Always produce"    "firefox $always_produce_link"                              "<Super><Shift>P"
    set_custom_keybind 31  "Slutty mic MOC"    "firefox $bm_moc"                                           "<Super><Shift>B"
    set_custom_keybind 32  "MM MOC"            "firefox $meta_models"                                      "<Super><Shift>M"
    set_custom_keybind 33  "SS MOC"            "firefox $simple_stories"                                   "<Super><Shift>I"
    set_custom_keybind 34  "Mat Futures"       "firefox $mat_futures"                                      "<Super><Shift>F"
    set_custom_keybind 35  "obs_perp_search"   "$hotkey_repo/obs_perp_hk.sh"                               "<Super><Shift>E"
    set_custom_keybind 36  "stt_transform"     "$prgm_repo/stt_transform/hotkey.sh"                        "<Super><Shift>T"
    set_custom_keybind 37  "csp MOC"           "firefox $csp_moc"                                          "<Super><Shift>C"

    ## sys services
    set_custom_keybind 40  "toggle Bluetooth"  "$prgm_repo/.setup/hotkeys/btPairing.sh"         	   "<Alt><Shift>B"
    set_custom_keybind 41  "fleetNotes"        "$prgm_repo/fleetingNotes/main/obs_fleet.sh"                "<Ctrl><Alt>F"
    set_custom_keybind 42  "slow_drip"         "$prgm_repo/slow_drip/hk_quick_capture.fish"                "<Ctrl><Alt>S"

}

run_it

# something to look into here is whether or not I want to overwrite the stock keybinds that Ubuntu comes with. I'd like to have <Super> be avail by itself as a prefix
#### But if it's a lot of work I'll do something else. It'd be nice to have that flexibility. Juice may not be worth the squeeze.
