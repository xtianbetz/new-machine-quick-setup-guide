#!/bin/bash

SOURCES="bin
Books
c
Code
Courses
d
Documents
Games
p
Pictures
Projects
Toolchains
.vim
.vimrc
.config/nvim
"

DEST1="/run/media/x/encrypted-sdcard/backup/"

for source in $SOURCES ; do
    CMD="rsync -avz $HOME/$source $DEST1"
    echo "Rsyncing to removable drive: ($CMD)"
    eval $CMD
done
