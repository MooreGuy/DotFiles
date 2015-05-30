#!/bin/bash

scriptPath=$(pwd)
curVimRCPath="./.vimrc"
oldPathExtension=".old"
vimRCPath="$HOME/.vimrc"
vimBundlePath="$HOME/.vim/bundle"
vimAutoloadPath="$HOME/.vim/autoload"
pathogenPath="$HOME/.vim/autoload/pathogen.vim"
tmuxConfigPath="$HOME/tmux.conf"
tmuxCurrentPath="./tmux.conf"

if [ -a $vimRcPath ];
  then
    echo "Vimrc already exists."
    cp -v "$vimRCPath" "$vimRCPath$oldPathExtension"
    cp -v "$curVimRCPath" "$vimRCPath"
else
  echo "Vimrc doesn't already exist"
  cp -v "$curVimRCPath" "$vimRCPath"

fi

if [ ! -d $vimBundlePath ];
  then
    echo "Vim bundle path doesn't already exists."	
	mkdir -v -p $vimBundlePath
fi

if [ ! -d $vimAutoloadPath ];
then
	echo "Vim autoload path doesn't already exist."
	mkdir -v -p $vimAutoloadPath
fi

# Install plugins
cd  ~/.vim/bundle

git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/fatih/vim-go
git clone https://github.com/scrooloose/syntastic

# Install pathogen
if [ ! -a $pathogenPath ]
then
	echo "Getting pathogen script."
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

cd $scriptPath
if [ -a $tmuxConfigPath ];
then
	echo "Tmux config already exists."
	cp -v "$tmuxConfigPath" "$tmuxConfigPath$oldPathExtension"
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
else
	echo "Tmux config doesn't already exist."
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
fi
