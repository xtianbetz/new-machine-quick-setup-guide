#!/bin/bash

SOURCES="
Code
Documents
Toolchains
.aws
.vim
.vimrc
.gitconfig
.bash
.bashrc
.yarn
.npm
.npm-packages
.cargo
.ideavimrc
"

CONFIGS="
.config/nvim
.config/JetBrains
.config/Code
"

#DEST1="/run/media/x/xtianbetz-002/backup/"

if [ "$1" = "" ] ; then
	echo "Usage: $0 source"
	exit 1
fi

SRC="$1"

for source in $SOURCES ; do
    CMD="rsync -avz $SRC:~/$source $HOME"
    echo "Rsyncing from remote: ($CMD)"
    eval $CMD
done

for source in $CONFIGS ; do
    CMD="rsync -avz $SRC:~/$source $HOME/.config"
    echo "Rsyncing from remote: ($CMD)"
    eval $CMD
done

rsync -av $SRC:~/.local/share/applications $HOME/.local/share/applications
