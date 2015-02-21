let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
syntax on
set clipboard=unnamed
set number
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start
set t_Co=16

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
set background=dark
colorscheme solarized
