#!/bin/bash

#--------------------------------
# check installation dependencies
#--------------------------------

dpkg -s git &> /dev/null

if [ $? -ne 0 ]
then
	echo ' git not installed.. please install git '	
	exit 1
fi

dpkg -s curl &> /dev/null


if [ $? -ne 0 ]
then
	echo ' curl not installed.. please install curl '	
	exit 1
fi

#-------------------------------
# if any .vimrc, backup
#-------------------------------

mv ~/.vimrc ~/.vimrc.bak
cp .vimrc ~/

#----------------------------
# installing pathegon pluggin
#----------------------------

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#--------------------
# installing pluggins 
#--------------------

cd ~/.vim/bundle

git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/Lokaltog/vim-easymotion.git 
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/kien/ctrlp.vim.git   
git clone https://github.com/Yggdroot/indentLine.git
