src="$1"
tgt="$2"
sudo umount "$tgt"*
echo "dd bs=4M conv=fdatasync status=progress if=$src of=$tgt"
read -p "continue?"
sudo dd bs=4M conv=fdatasync status=progress if="$src" of="$tgt" && /usr/bin/sync && notify-send "Burning ISO Image" "Completed" || notify-send "Burning ISO Image" "Failed"
