#!/bin/fish

set name "$HOME/$(date +%s).png"
if test (count $argv) -eq 0
	set response $(echo -e "📷  Entire Screen\n📸  Selection\n🏃  Active Window\n📌  Select Window From Menu" | fuzzel --dmenu -l 4)
else
	switch $argv[1]
		case 1
			set response "📷  Entire Screen"
		case 2
			set response "📸  Selection"
		case 3
			set response "🏃  Active Window"
		case 4
			set response "📌  Select Window From Menu"
	end
end
switch $response
	case "📷  Entire Screen"
		grim $name && wl-copy -t image/png < $name && notify-send -i "camera" "Captured screenshot of ENTIRE SCREEN and copied to clipboard." -t 3000
	case "📸  Selection"
		grim -g $(slurp) $name && wl-copy -t image/png < $name && notify-send -i "camera" "Captured screenshot of SELECTION and copied to clipboard." -t 3000
	case "🏃  Active Window"
		while read -l line
			if string match --regex "^\* " $line
				set geom (string split -n -m 2 ": " $line)[2] && grim -g $geom $name && wl-copy -t image/png < $name && notify-send -i "camera" "Captured screenshot of ACTIVE WINDOW and copied to clipboard." -t 3000
			end
		end < "/tmp/dwl-clients"
	case "📌  Select Window From Menu"
		set line $(fuzzel --dmenu < "/tmp/dwl-clients")
		set geom (string split -n -m 2 ": " $line)[2]
		grim -g $geom $name && wl-copy -t image/png < $name && notify-send -i "camera" "Captured screenshot of SELECTED WINDOW and copied to clipboard." -t 3000
end
