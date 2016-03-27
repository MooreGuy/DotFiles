#!/bin/bash

# Paths for installation
# =========================================================
scriptPath=$(pwd)

oldPathExtension=".old"

vimDir="$HOME/.vim"
curVimRCPath="./vim/vimrc"
vimRCPath="$HOME/.vimrc"
vimBundlePath="$HOME/.vim/bundle"
vimAutoloadPath="$HOME/.vim/autoload"
vimFiletypePath="$HOME/.vim/filetype.vim"
curVimFiletypePath="./vim/filetype.vim"

pathogenPath="$HOME/.vim/autoload/pathogen.vim"

tmuxConfigPath="$HOME/.tmux.conf"
tmuxCurrentPath="./tmux.conf"

bashRCPath="$HOME/.bashrc"
curBashRCPath="./bash/bashrc"

# Setup Vim
# =========================================================
if [ ! -d $vimDir ]
then
	mkdir -v -p $vimDir
fi

if [ -e $vimRCPath ]
then
	echo "Vimrc already exists."
	cp -v "$vimRCPath" "$vimRCPath$oldPathExtension"
	cp -v "$curVimRCPath" "$vimRCPath"
else
	cp -v "$curVimRCPath" "$vimRCPath"
fi

if [ ! -d $vimBundlePath ]
then
	mkdir -v -p $vimBundlePath
fi

if [ ! -d $vimAutoloadPath ]
then
	mkdir -v -p $vimAutoloadPath
fi

if [ -e $vimFiletypePath ]
then
	echo "Vim filetype file already exists"
	cp -v "$vimFiletypePath" "$vimFiletypePath$oldPathExtension"
	cp -v "$curVimFiletypePath" "$vimFiletypePath"
else
	cp -v "$curVimFiletypePath" "$vimFiletypePath"
fi

# Install plugins
# =========================================================
cd  ~/.vim/bundle

# Clone all vim plugins
# =========================================================
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/fatih/vim-go
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/bling/vim-airline
git clone https://github.com/burnettk/vim-angular
git clone https://github.com/chriskempson/base16-vim.git

# Install pathogen script
# =========================================================
if [ ! -e $pathogenPath ]
then
	echo "Getting pathogen script."
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Load bashrc
# =========================================================
cd $scriptPath
if [ -e $bashRCPath ]
then
    echo "BashRC already exists."
    cp -v "$bashRCPath" "$bashRCPath$oldPathExtension"
    cp -v "$curBashRCPath" "$bashRCPath"
else
  cp -v "$curBashRCPath" "$bashRCPath"
fi

# Setup Tmux
# =========================================================

# Load tmux configuration
if [ -e $tmuxConfigPath ]
then
	echo "Tmux config already exists."
	cp -v "$tmuxConfigPath" "$tmuxConfigPath$oldPathExtension"
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
else
	cp -v "$tmuxCurrentPath" "$tmuxConfigPath"
fi
