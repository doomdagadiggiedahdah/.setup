# thine setup
- fun story; once I accidentally ran a command that accidentally reset my hotkeys (which makes me sad) and at that point only knew how to set them through the gui (read: slowly, painfully).
- The command did show me how to set hotkeys via the cli, and so a solution was set.
- this is the result of realizing again that scripts are your friend, and that I like having some pieces of consistency in my life. Hotkeys.
## autostart
- quick lesson on symlinks, config files, and version control.
- if you would like to back up your config files (files your computer looks to run specific actions) in an easier to manage fashion, then you'll need to put the actual config files in the git repo and use a symlink to tell your system to look for them in the git repo.
- On my computer the autostart repo lives in my `~/programming_folder/`, but for programs to be run on startup you need to make an entry in your `~/.config/autostart/` folder. 
- The solution is to run `ln -s ~/programming_folder/autostart ~/.config/`. Everyone's happy. (of course, not having to manually run the `ln` command on install would be ideal).
## Thank you
- Thank you to [Thor](https://github.com/thor314/.setup) for the inspiration