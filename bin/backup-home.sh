#!/bin/bash

SOURCES="bin
Books
c
Code
Courses
d
Documents
Games
Music
p
Pictures
Projects
Videos
Toolchains
.ssh
.aws
.vim
.vimrc
.config/nvim
.config/JetBrains
.config/Code
.gitconfig
.bash
.bashrc
.yarn
.npm
.npm-packages
.cargo
.ideavimrc
.local/share/applications
"

#DEST1="/run/media/x/xtianbetz-002/backup/"

if [ "$1" = "" ] ; then
	echo "Usage: $0 volume-name"
	exit 1
fi

DEST1="/run/media/x/$1/backup/"

for source in $SOURCES ; do
    CMD="rsync -avz $HOME/$source $DEST1"
    echo "Rsyncing to removable drive: ($CMD)"
    eval $CMD
done
