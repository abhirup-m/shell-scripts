FILE="$1"
img2pdf "$FILE" -o "${FILE%%.*}.pdf"
