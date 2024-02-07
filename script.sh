#!/bin/bash

pgrep -fa VIM_SERVER || vimmer "$2"
vim --servername VIM_SERVER --remote-send ":e $2<CR>"
vim --servername VIM_SERVER --remote-send ":call cursor($1,0)<CR><CR>"
wmctrl -xa editor
