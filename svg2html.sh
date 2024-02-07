#!/bin/bash
#

[[ -f $1.css ]] || touch $1.css
vimmer $1.css
while :; do
	echo -e "<html lang="en">\n<style>\n" > $1.html
	cat $1.css >> $1.html
	echo -e "</style>\n<body>\n" >> $1.html
	cat $1.svg >> $1.html
	echo -e "</body>\n</html>" >> $1.html
	sleep 1
done
