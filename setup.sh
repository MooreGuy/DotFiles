#!/bin/bash

# Paths for installation
# =========================================================
scriptPath=$(pwd)

oldPathExtension=".old"

vimDir="$HOME/.vim"
curVimrcPath="./vim/vimrc"
vimrcPath="$HOME/.vimrc"
vimBundlePath="$HOME/.vim/bundle"
vimAutoloadPath="$HOME/.vim/autoload"
vimFiletypePath="$HOME/.vim/filetype.vim"
curVimFiletypePath="./vim/filetype.vim"

pathogenPath="$HOME/.vim/autoload/pathogen.vim"

tmuxConfigPath="$HOME/.tmux.conf"
tmuxCurrentPath="./tmux.conf"

bashrcPath="$HOME/.bashrc"
curBashrcPath="./bash/bashrc"
zshrcPath="$HOME/.zshrc"
curZshrcPath="./zsh/zshrc"

# Setup Vim
# =========================================================
if [ ! -d $vimDir ]
then
	mkdir -v -p $vimDir
fi

if [ -e $vimrcPath ]
then
	echo "Vimrc already exists."
	cp -v "$vimrcPath" "$vimrcPath$oldPathExtension"
	cp -v "$curVimrcPath" "$vimrcPath"
else
	cp -v "$curVimrcPath" "$vimrcPath"
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

# PLUGINS
# =========================================================
cd  ~/.vim/bundle

# Clone all vim plugins
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/chriskempson/base16-vim.git

# git plugins
git clone https://github.com/airblade/vim-gitgutter

# Statusline - Airline
git clone git@github.com:vim-airline/vim-airline.git
git clone git@github.com:vim-airline/vim-airline-themes.git

# Language specific plugins
git clone https://github.com/fatih/vim-go
git clone https://github.com/burnettk/vim-angular
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/rust-lang/rust.vim

# LaTeX
git clone git@github.com:xuhdev/vim-latex-live-preview.git

# Debugging
git clone https://github.com/joonty/vdebug.git

# Install pathogen script
if [ ! -e $pathogenPath ]
then
	echo "Getting pathogen script."
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Load bashrc
# =========================================================
cd $scriptPath
if [ -e $bashrcPath ]
then
    echo "Bashrc already exists."
    cp -v "$bashrcPath" "$bashrcPath$oldPathExtension"
    cp -v "$curBashrcPath" "$bashrcPath"
else
  cp -v "$curBashrcPath" "$bashrcPath"
fi

# Load zshrc
# =========================================================
cd $scriptPath
if [ -e $zshrcPath ]
then
    echo "zshrc already exists."
    cp -v "$zshrcPath" "$zshrcPath$oldPathExtension"
    cp -v "$curZshrcPath" "$zshrcPath"
else
  cp -v "$curZshrcPath" "$zshrcPath"
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
