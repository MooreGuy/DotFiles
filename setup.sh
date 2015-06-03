#!/bin/bash

scriptPath=$(pwd)

oldPathExtension=".old"

curVimRCPath="./.vimrc"
vimRCPath="$HOME/.vimrc"
vimBundlePath="$HOME/.vim/bundle"
vimAutoloadPath="$HOME/.vim/autoload"

pathogenPath="$HOME/.vim/autoload/pathogen.vim"

tmuxConfigPath="$HOME/.tmux.conf"
tmuxCurrentPath="./.tmux.conf"

bashRCPath="$HOME/.bashrc"
curBashRCPath="./.bashrc"

if [ -e $vimRCPath ]
then
	echo "Vimrc already exists."
	cp -v "$vimRCPath" "$vimRCPath$oldPathExtension"
	cp -v "$curVimRCPath" "$vimRCPath"
else
	echo "Vimrc doesn't already exist"
	cp -v "$curVimRCPath" "$vimRCPath"
fi

if [ ! -d $vimBundlePath ]
then
	echo "Vim bundle path doesn't already exists."	
	mkdir -v -p $vimBundlePath
fi

if [ ! -d $vimAutoloadPath ]
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
if [ ! -e $pathogenPath ]
then
	echo "Getting pathogen script."
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Load bashrc
cd $scriptPath
if [ -e $bashRCPath ]
then
    echo "BashRC already exists."
    cp -v "$bashRCPath" "$bashRCPath$oldPathExtension"
    cp -v "$curBashRCPath" "$bashRCPath"
else
  echo "BashRC doesn't already exist"
  cp -v "$curBashRCPath" "$bashRCPath"
fi

# Load tmux configuration
if [ -e $tmuxConfigPath ]
then
	echo "Tmux config already exists."
	cp -v "$tmuxConfigPath" "$tmuxConfigPath$oldPathExtension"
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
else
	echo "Tmux config doesn't already exist."
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
fi
