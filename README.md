# Bash shell scripts

These are some bash scripts that I use on a daily basis on my Arch+dwm setup. Most are *not* posix-compliant. The individual scripts are listed below.

- [**alt-open**](alt-open): File opener with alternate applications. I call this from the lf file manager using a hotkey

- [**anime_search.py**](anime_search.py): Python script for fetching information about anime from MyAnimeList

- [**archiver**](archiver): Packs and unpacks archives from the command line using atool

- [**brightness-show**](brightness-show): Displays current brightness using notification daemon

- [**bulk-rename**](bulk-rename): Accepts list of files, opens vim buffer with list where you can edit the names, and on closing renames the files to the changed names

- [**change_wall**](change_wall): Chooses image randomly from folder and sets it as wallpaper using xwallpaper

- [**compile**](compile): General script to compile files of certain extensions using predefined compilers

- [**current_window_name**](current_window_name): Returns name of active window

- [**dwm_reload**](dwm_reload): Makes, installs and restarts DWM by killing the current DWM process, and brings up terminal with errors if they occur

- [**dwmblock_scripts/battery-show**](dwmblock_scripts/battery-show): Outputs current battery percentage with icon, suspends if battery is below a certain percentage

- [**dwmblock_scripts/datetime-show**](dwmblock_scripts/datetime-show): Outputs date and time

- [**dwmblock_scripts/mail-show**](dwmblock_scripts/mail-show): Outputs mail status

- [**dwmblock_scripts/music-show**](dwmblock_scripts/music-show): Outputs name of song being played currently in mocp

- [**dwmblock_scripts/volume-show**](dwmblock_scripts/volume-show): Outputs volume 

- [**dwmblock_scripts/wifi-show**](dwmblock_scripts/wifi-show): Outputs SSID of the active connection

- [**ff**](ff): Ffmpeg script for doing lots of stuff like cutting media, converting media, etc

- [**fileman**](fileman): Opens file manager from multiple alternatives

- [**finder**](finder): Lists all text files under given directory and subdirectories, potentially useful for piping into Dmenu

- [**focus_by_xid**](focus_by_xid): Lists xid of open windows in Dmenu and switches to selected xid

- [**fuzzyopen**](fuzzyopen): Fuzzy-selects file in lf file manager and opens it

- [**killwin**](killwin): Kills current window, saves all buffers if window is vim

- [**lfrun**](lfrun): Special script for running lf with ueberzug for image preview

- [**lock**](lock): Locks screen with i3lock and image

- [**mount-all**](mount-all): Lists available usb and other removable drives in Dmenu, and mounts the selected drive

- [**mount_and_open**](mount_and_open): Opens the mounted drive in file manager, for use in devmon

- [**musicstart**](musicstart): Starts mocp server in music directory

- [**network**](network): Lists connections for selecting a particular to connect

- [**open_book**](open_book): Outputs list of books into dmenu and opens selected one with evince

- [**opener**](opener): Global file opener, xdg-open replacement

- [**song-select**](song-select): Lists songs from directory into dmenu and plays selected song in mocp

- [**unmount**](unmount): Lists mounted removable drives and unmounted selected ones

- [**vimmer**](vimmer): Opens given file in vim with predefined servername, starts server if not already running

- [**volume**](volume): Shows volume in notification daemon

- [**zathura_detach**](zathura_detach): De(at)taches zathura window to running tabbed window

- [**zathura_tabbed**](zathura_tabbed): Starts zathura in tabbed
