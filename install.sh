#!/bin/bash

echo "" 

echo "#-----------------------------------------------------------------------"
echo "# [installation] .vimrc and pluggings for girishadurrel's vimrc [BEGIN] "
echo "#-----------------------------------------------------------------------"

echo "" 

#--------------------------------
# check installation dependencies
#--------------------------------

echo -e "\t * checking for vim installation..."

dpkg -s vim &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + git not installed.. please install git "	
	exit 1
else
	echo -e "\t\t + vim installation check, success... "
fi
echo ""

echo -e "\t * checking for git installation..."

dpkg -s git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + git not installed.. please install git "	
	exit 1
else
	echo -e "\t\t + git installation check, success... "
fi
echo ""

echo -e "\t * checking for curl installation..."

dpkg -s curl &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + curl not installed.. please install curl "	
	exit 1
else
	echo -e "\t\t + curl installation check, success... "
fi
echo ""

#-----------------------
# if any .vimrc, backup
#-----------------------

echo -e "\t * installing the .vimrc file... "

echo -e "\t\t + checking for previous .vimrc, if any backing it up (~/.vimrc.bak)... "

mv -f ~/.vimrc ~/.vimrc.bak &> /dev/null

echo -e "\t\t + copying girishadurrel's .vimrc... "

cp .vimrc ~/

echo ""

#----------------------------
# installing pathegon pluggin
#----------------------------

echo -e "\t * installing a pathegon, plugging manager for vim... "

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t + pathegon installation failed..."
	exit 1
else
	echo -e "\t\t + pathegon installation success..."
fi

echo ""

#--------------------
# installing pluggins
#--------------------

cd ~/.vim/bundle

echo -e "\t * installing the pluggins... "

echo -e "\t\t + nerdtree..."
git clone https://github.com/scrooloose/nerdtree.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo -e "\t\t + easymotion..."
git clone https://github.com/Lokaltog/vim-easymotion.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo -e "\t\t + nerdcommentor..."
git clone https://github.com/scrooloose/nerdcommenter.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo -e "\t\t + syntatic..."
git clone https://github.com/scrooloose/syntastic.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo -e "\t\t + ctrlp..."
git clone https://github.com/kien/ctrlp.vim.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo -e "\t\t + indentLine..."
git clone https://github.com/Yggdroot/indentLine.git &> /dev/null

if [ $? -ne 0 ]
then
	echo -e "\t\t\t - installation failed..."
	exit 1
else
	echo -e "\t\t\t - installation success..."
fi

echo "" 

echo "#----------------------------------------------------------------------------"
echo "# [installation] .vimrc and pluggings for girishadurrel's vimrc... [END]"
echo "#----------------------------------------------------------------------------"

echo "" 
