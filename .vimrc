"-------------------------------------------------------
" .vimrc file
" Author: Girisha Durrel De Silva <girisha@girisha.net>
" Description: a newbie trying out his first .vimrc file
"-------------------------------------------------------

"-------------------------------------------------------
" pluggin executer pathogen 
" extracted from [https://github.com/tpope/vim-pathogen]
"-------------------------------------------------------

"
" set of pluggins used currently
"
" NERDTree [https://github.com/scrooloose/nerdtree]
" EasyMotion [https://github.com/Lokaltog/vim-easymotion]
" NERDCommenter [https://github.com/scrooloose/nerdcommenter]
" syntatic [https://github.com/scrooloose/syntastic]
" ctrlP [https://github.com/kien/ctrlp.vim]
" indentLine [https://github.com/Yggdroot/indentLine]
" AutoClose [https://github.com/vim-scripts/AutoClose]
"
execute pathogen#infect()

"
"  remove unwanted options on VIM (sometimes added by your distro), 
"  make it more like VIM and ~VI
"
set nocompatible

"
" show line number at the left hand corner
"
set number

"
" highlight text 
"
syntax on

"
" have a $ sign at the end of 'cw'
"
set cpoptions+=$

"
" set confirm dialog rather than the command failing
"
set confirm

"
" set show command, also show the ^=^ nice menu
"
set showcmd
set wildmenu


"
" Something needed with NERDCommenter
" see [https://github.com/scrooloose/nerdcommenter]
"
filetype plugin on

"
" set working directory.NO LONGER USED [ this will allow nerdtree to 
" open the directory structure from ~/Projects ]
" now nerdtree working directory will be the current working directory
"

" cd ~/Projects
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>


"-------------------------------------------------------
" * Mapped Keys
" 
" 1. <F5> :  check spelling [needed for documents] 
"-------------------------------------------------------

"
" spell check toggle key
" mapped key <F5>
" language en_us
"
map <F5> :setlocal spell! spelllang=en_us<CR>

"
" mapped CTRL + L for NERDTREE toggle in normal mode
"
nmap <silent> <C-L> :NERDTreeToggle<CR>

"
" using the autoclose plugin. sometimes its very annoying to 
" add the semicolon ';' at the end of the line.
" mapped \a in the insert mode to add the semi-colon at the 
" end of the line 
"
inoremap <leader>; <C-o>A;
