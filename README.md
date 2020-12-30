# girishadurrel's vim config. file (~/.vimrc)

A very simple .vimrc file :)

installation
------------

* clone repository ( $ git clone https://github.com/girishadurrel/vimrc.git )
* go into repository directory ( $ cd vimrc )
* $ chmod +x install.sh
* $ ./install.sh [-y enable_ycm ] [-g enable_vimgo ]

important note
--------------

* install script, tested on Ubuntu and MacOS
* make sure you have vim, curl and git installed

plugins installed ( brief description only, please visit respective websites for more details )
------------------

* NERDTree [https://github.com/scrooloose/nerdtree]: provides a sidebar file explorer on vim ( mapped in my vimrc to CTRL+L to toggle it ), the file explorer should list out the current directory files
* EasyMotion [https://github.com/Lokaltog/vim-easymotion]: a fast and easy way to navigate on code/text your currently editing. activated by <leader><leader>w and then pressing the key to go to the position you need to navigate to
* NERDCommenter [https://github.com/scrooloose/nerdcommenter]: a fast an efficient way to comment code
* Syntatic [https://github.com/scrooloose/syntastic]: checks for any syntax errors in your code. supports many languages. activated when the file is saved ( <esc> :w <cr> )
* CtrlP [https://github.com/kien/ctrlp.vim]: a fuzzy search for vim
* indentLine [https://github.com/Yggdroot/indentLine]: plugin used for displaying thin vertical lines at each indentation level for code indented with spaces. very useful when coding python
* AutoClose [https://github.com/vim-scripts/AutoClose]: autoclose open brackets etc. if you find it annoying you can disable it with &lt;leader&gt; a in the normal mode
* YouCompleteMe [https://github.com/Valloric/YouCompleteMe]: code completion for vim. Please note that you have to build YouCompleteMe in order to use it. Instructions on how to build it can be found in the official YouCompleteMe github page (wiki). This plugin will not be installed by default, set the command line parameter -y to true in the install script
* vim-go [https://github.com/fatih/vim-go]: must have for a gopher ;) This plugin will not be installed by default, set the command line parameter -g to true in the install script
* emmet-vim [https://github.com/mattn/emmet-vim] makes writing html/css on vim a breeze

vimrc file
----------
* the vimrc file contains all the relevant information (stated in comments) as to what each and every line is doing
