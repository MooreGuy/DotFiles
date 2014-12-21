#!/bin/bash

curVimRCPath="./.vimrc"
oldPathExtension=".old"
vimRCPath="$HOME/.vimrc"

if [ -a $vimRcPath ];
  then
    echo "Vimrc already exists."
    cp -v "$vimRCPath" "$vimRCPath$oldPathExtension"
    cp -v "$curVimRCPath" "$vimRCPath"
else
  echo "Vimrc doesn't already exist"
  cp -v "$curVimRCPath" "$vimRCPath"

fi
