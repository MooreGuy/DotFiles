#!/bin/bash

# Paths for installation
# =========================================================
scriptPath=$(pwd)

oldPathExtension=".old"

vimDir="$HOME/.vim"
curVimrcPath="$scriptPath/vim/vimrc"
vimrcPath="$HOME/.vimrc"
vimBundlePath="$HOME/.vim/bundle"
vimAutoloadPath="$HOME/.vim/autoload"
vimFiletypePath="$HOME/.vim/filetype.vim"
curVimFiletypePath="$scriptPath/vim/filetype.vim"

pathogenPath="$HOME/.vim/autoload/pathogen.vim"

tmuxConfigPath="$HOME/.tmux.conf"
tmuxCurrentPath="$scriptPath/tmux.conf"

bashrcPath="$HOME/.bashrc"
curBashrcPath="$scriptPath/bash/bashrc"
zshrcPath="$HOME/.zshrc"
curZshrcPath="$scriptPath/zsh/zshrc"

# Setup Vim
# =========================================================
if [[ ! -d $vimDir ]]; then
  mkdir -v -p $vimDir
fi

if [[ -e $vimrcPath || -h $vimrcPath ]]; then
  echo "Vimrc already exists."
  rm -f "$vimrcPath" "$vimrcPath$oldPathExtension"
fi
ln -s "$curVimrcPath" "$vimrcPath"

if [[ ! -d $vimBundlePath ]]; then
  mkdir -v -p $vimBundlePath
fi

if [[ ! -d $vimAutoloadPath ]]; then
  mkdir -v -p $vimAutoloadPath
fi

if [[ -e $vimFiletypePath || -h $vimFiletypePath ]]; then
  echo "Vim filetype file already exists"
  rm -f "$vimFiletypePath" "$vimFiletypePath$oldPathExtension"
fi
ln -s "$curVimFiletypePath" "$vimFiletypePath"

# PLUGINS
# =========================================================
cd  ~/.vim/bundle

# Clone all vim plugins
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/chriskempson/base16-vim.git
git clone https://github.com/tpope/vim-sleuth
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone git@github.com:Yggdroot/indentLine.git

# git plugins
git clone https://github.com/airblade/vim-gitgutter.git

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

# TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pathogen script
if [[ ! -e $pathogenPath || -h $pathogenPath ]]; then
  echo "Getting pathogen script."
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Load bashrc
# =========================================================
cd $scriptPath
if [[ -e $bashrcPath || -h $bashrcPath ]]; then
  echo "Bashrc already exists."
  rm -f "$bashrcPath" "$bashrcPath$oldPathExtension"
fi
ln -s "$curBashrcPath" "$bashrcPath"

# Load zshrc
# =========================================================
cd $scriptPath
if [[ -e $zshrcPath || -h $zshrcPath ]]; then
  echo "zshrc already exists."
  rm -f "$zshrcPath" "$zshrcPath$oldPathExtension"
fi
ln -s "$curZshrcPath" "$zshrcPath"

# Setup Tmux
# =========================================================

# Load tmux configuration
if [[ -e $tmuxConfigPath || -h $tmuxConfigPath ]]; then
  echo "Tmux config already exists."
  rm -f "$tmuxConfigPath" "$tmuxConfigPath$oldPathExtension"
fi
ln -s "$tmuxCurrentPath" "$tmuxConfigPath"

source "$bashrcPath"
