if status is-interactive
	#  and not set -q TMUX
	#  exec tmux
end

set -x PATH $HOME/.local/bin $PATH

# load api keys
if test -f ~/.config/.api_keys
	source ~/.config/.api_keys
end

set prgm "/home/mat/Documents/ProgramExperiments/fleetingNotes/main/"



# Anki-fleetNote "send to deck" command
source ~/.config/op/plugins.sh
alias ans=$prgm'checkForFiles.sh'
alias anc=$prgm'sttToAnki.sh'
alias shownotes='ls '$prgm'note_folder'
alias paste="xclip -o -selection clipboard >"
alias goNotes='cd '$prgm'note_folder'
alias dlyt='yt-dlp -x --audio-format "m4a" --audio-quality "0" $1'
alias ve='python3 -m venv ./venv; echo "venv/" >> .gitignore' # it'd be good to check if this exists already and if no, then creates
alias va="source ./venv/bin/activate.fish"
alias copy="xclip -selection clipboard"
alias pvc="protonvpn-cli c"
alias pvd="protonvpn-cli d"
alias wifiqr="nmcli device wifi show-password"
alias ipadd="wget -qO- http://ipecho.net/plain | xargs echo"
alias prgm="cd /home/mat/Documents/ProgramExperiments"
alias hkh="cd /home/mat/Documents/ProgramExperiments/.setup/hotkeys/"
function mkv2mp4
    ffmpeg -i $argv[1] -c copy (string replace -r '\.mkv$' '_copy.mp4' $argv[1])
end
alias obs_snip='cd /home/mat/Obsidian/.obsidian/snippets/'
alias pm='python3 main.py'
alias vmm='vim main.py'
alias spot='a=$(pwd)'
alias vim='nvim'
alias ee='espanso edit'
alias ss='source .venv/bin/activate.fish'
alias deacc='deactivate'
alias blg='cd ~/Documents/blogg/'
alias obss='cd /home/mat/Documents/obsidian_setup'
alias pics='cd /home/mat/Pictures/onePlis_Camera/Camera'

# edit configs
alias edfish='vim /home/mat/.config/fish/config.fish; source /home/mat/.config/fish/config.fish'
alias edkitty='vim .config/kitty/kitty.conf; kitty @ load-config'
alias edhk='vim /home/mat/Documents/ProgramExperiments/.setup/keybinds.sh; /home/mat/Documents/ProgramExperiments/.setup/keybinds.sh'

# path
fish_add_path -a /home/mat/.foundry/bin
fish_add_path -a /home/mat/.npm-global/bin
fish_add_path -g /usr/local/go/bin
fish_add_path -g ~/.local/bin/

# editor
set -gx EDITOR "nvim"

if [ -f '/home/mat/google-cloud-sdk/path.fish.inc' ]; . '/home/mat/google-cloud-sdk/path.fish.inc'; end
set -gx PATH /usr/local/go/bin $PATH
alias newest='ls -t | head -1'

