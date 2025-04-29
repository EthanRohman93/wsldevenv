#!/bin/bash

cp $HOME/.bashrc $HOME/.bashrc-backup
cp $HOME/.vimrc $HOME/.vimrc-backup
cp ./.bashrc  $HOME/.bashrc
cp ./.vimrc  $HOME/.vimrc

# install vim and tmux
sudo apt update
if ! vim --version; then
    sudo apt install vim
fi

if ! tmux --version; then
    sudo apt install tmux
fi

# install vim plugins
rm -rf $HOME/.vim/bundle
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone -b release https://github.com/neoclide/coc.nvim $HOME/.vim/bundle/coc.nvim
git clone https://github.com/junegunn/fzf.vim.git $HOME/.vim/bundle/fzf.vim
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.vim/bundle/fzf
chmod +x $HOME/.vim/bundle/fzf/install
$HOME/.vim/bundle/fzf/install
