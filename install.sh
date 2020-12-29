#!/bin/bash

#--------------------------------
# Function to install plugins
#--------------------------------

function install {

    #
    # gymnatics to get the project name. lolz
    #
    p_name=$(echo $1 | rev | cut -d"/" -f 1 | rev | rev | cut -d"." -f 2- | rev)
    echo -e "\t\t "$p_name"..."

    # check for directory. if directory exists then assume the plugin
    # is already installed
    if [ -d "$p_name" ]; then
        echo -e "\t\t\t - seems like "$p_name" is already installed"
    else
        git clone $1 &> /dev/null

        if [ $? -ne 0 ]
        then
            echo -e "\t\t\t - installation failed..."
        else
            echo -e "\t\t\t - installation success..."
        fi
    fi
}

echo "" 

echo "#-----------------------------------------------------------------------"
echo "# [installation] .vimrc and plugins for girishadurrel's vimrc [BEGIN] "
echo "#-----------------------------------------------------------------------"

echo "" 

#--------------------------------
# check installation dependencies
#--------------------------------

if [[ "$OSTYPE" == "linux-gnu" || "$OSTYPE" == "darwin"* ]]; then 

    echo -e "\t * checking for vim installation..."

    command -v vim &> /dev/null

    if [ $? -ne 0 ]
    then
        echo -e "\t\t + vim not installed.. please install vim "	
        exit 1
    else
        echo -e "\t\t + vim installation check, success... "
    fi
    echo ""

    echo -e "\t * checking for git installation..."

    command -v git &> /dev/null

    if [ $? -ne 0 ]
    then
        echo -e "\t\t + git not installed.. please install git "	
        exit 1
    else
        echo -e "\t\t + git installation check, success... "
    fi
    echo ""

    echo -e "\t * checking for curl installation..."

    command -v curl &> /dev/null

    if [ $? -ne 0 ]
    then
        echo -e "\t\t + curl not installed.. please install curl "	
        exit 1
    else
        echo -e "\t\t + curl installation check, success... "
    fi
    echo ""

else 
    echo -e "\t\t install script not supported on your OS"
    exit 1
fi

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
# installing pathegon plugin
#----------------------------

echo -e "\t * installing a pathegon, plugin manager for vim... "

# copy pasted from the pathogen github page [https://github.com/tpope/vim-pathogen]

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
# installing plugins
#--------------------

cd ~/.vim/bundle

echo -e "\t * installing the plugins... "

install https://github.com/scrooloose/nerdtree.git
install https://github.com/Lokaltog/vim-easymotion.git
install https://github.com/scrooloose/nerdcommenter.git
install https://github.com/scrooloose/syntastic.git
install https://github.com/kien/ctrlp.vim.git
install https://github.com/Yggdroot/indentLine.git
install https://github.com/vim-scripts/AutoClose.git
install https://github.com/mattn/emmet-vim.git

# uncomment this if Go is your thing!
#install https://github.com/fatih/vim-go.git vim-go
# 

#---------------------------------------------------
# check vim version before installing YouCompleteMe 
#---------------------------------------------------
command -v bc &> /dev/null # should be there by default?

if [ $? -eq 0 ]
then
    #
    # as of 23-03-2017, YouCompleteMe supports vim ver. 7.4 patch 143 and above
    # not sure if this is the best way to do it :P
    #
    vmin=7.4
    pmin=143

    ver=$(vim --version | head -2 |  cut -d ' ' -f 5) 

    if [[ "$OSTYPE" == "darwin"* ]];
    then
        patch=$(vim --version | head -3 | tail -1 | cut -d '-' -f 2) 
    else
        patch=$(vim --version | head -2 | tail -1 | cut -d '-' -f 2) 
    fi

    if [ 1 -eq "$(echo "${ver} >= ${vmin}" | bc)" ] 
    then
        if [ $patch -ge $pmin ]
        then
            install https://github.com/Valloric/YouCompleteMe.git YouCompleteMe
        fi
    fi 
fi

echo "#----------------------------------------------------------------------------"
echo "# [installation] .vimrc and pluggings for girishadurrel's vimrc... [END]"
echo "#----------------------------------------------------------------------------"

echo "" 
