#!/usr/bin/bash



Clock(){
	TIME=$(date "+%I:%M")
	echo -e -n "%{B${workspace_colors[1]}}%{F${workspace_fgcolors[1]}}  ${TIME}  %{B$bgcolor}" 
}


Calendar(){
	DATE=$(date "+%a, %b %d")
	echo -e -n "%{B${workspace_colors[0]}}%{F${workspace_fgcolors[0]}}  ${DATE}  %{B$bgcolor}" 
}


Workspaces(){
	active_desktop=$(($(xdotool get_desktop) + 1))
	for i in $(seq 1 $workspace_num); do
		if [ $i == "$active_desktop" ]; then
			text="%{U$bgcolor}%{+u} $i %{-u}"
		else
			text=" $i "
		fi
		workspace_string=$workspace_string"%{A:berryc switch_workspace $((i-1)):}%{B${workspace_colors[$(( $i - 1 ))]}}%{F${workspace_fgcolors[$(( $i - 1 ))]}}"$text"%{F${workspace_colors[$(( $i - 1 ))]}}%{B${workspace_colors[$i]}}%{A}"
	done
	echo -ne "$workspace_string%{F$fgcolor}%{B$bgcolor}"
}


ActiveWindow(){
	windowname=$(xdotool getactivewindow getwindowclassname)
	! [ -z "$windowname" ] && echo -ne "[$windowname]"
}

Battery() {
	BATTACPI=$(acpi --battery)
	BATPERC=$(echo $BATTACPI | cut -d, -f2 | tr -d '[:space:]')

	echo -e "%{B${workspace_colors[3]}}%{F${workspace_fgcolors[3]}}   $BATPERC%  %{B$bgcolor}"
}

Sound(){
	VOL=$(($(amixer sget Master | tail -n 1 | cut -d ' ' -f5) * 100 / 87 ))
	icon=$([[ $(amixer sget Master | tail -n 1) == *"[off]"* ]] && echo "   " || echo "   ")
	echo -ne "%{B${workspace_colors[2]}}%{F${workspace_fgcolors[2]}}"$icon"%{A:amixer sset Master toggle:}$VOL%%%{A}  "
}

Run(){
while true; do
	echo -e "%{l}$(Workspaces) %{c}$(ActiveWindow) %{r}$(Battery)$(Sound)$(Clock)$(Calendar)"
	sleep 0.1s
done
}


bgcolor="#1d2330"
fgcolor="#ffffff"
fontname="UbuntuMono Nerd Font Mono"
fontstyle="regular"
fontsize=17
xoffset=30
height=25
workspace_num=4
workspace_colors=("#9dabb8" "#7d8996" "#5d6774" "#3d4552" "#1d2330")
workspace_fgcolors=("#000000" "#000000" "#ffffff" "#ffffff")

killall trayer; trayer --edge top --align left --transparent true --alpha 0 --tint 0x${bgcolor:1} --widthtype pixel --width 30 --height 30 --SetDockType True --SetPartialStrut True &
killall lemonbar; Run \
	| lemonbar -p -F$fgcolor -B$bgcolor \
	-f "$fontname:size=$fontsize:style=$fontstyle" \
	-g x$height+$xoffset+ -o 1 -u 2 | while read line; do eval "${line}"; done
