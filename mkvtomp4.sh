input="$1"
ffmpeg -i "$input" -c copy -c:s mov_text "${input%.*}.mp4"
