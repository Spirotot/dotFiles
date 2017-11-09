"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
set encoding=utf-8
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1

let g:table_mode_corner="|"
"let g:table_mode_corner="+"
"let g:table_mode_header_fillchar="="
" https://github.com/vim-pandoc/vim-pandoc-after
let g:pandoc#after#modules#enabled = ["tablemode"]
"Remove markdown and vimwiki types from YCM blacklist.
    let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'qf' : 1,
          \ 'notes' : 1,
          \ 'unite' : 1,
          \ 'text' : 1,
          \ 'infolog' : 1,
          \ 'mail' : 1
          \}

  let g:ycm_semantic_triggers =  {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
    \	'pandoc' : ['re!^@', ' @', ' [@'],
    \	'markdown.pandoc' : ['re!^@', ' @', ' [@'],
    \	'markdown' : ['re!^@', ' @', ' [@']
    \ }

let g:ale_sh_shellcheck_options = '-x'

"Don't let vimwiki clobber YCM's <Tab> mapping.
let g:vimwiki_table_mappings = 0

let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.wiki': 'default'}
let g:vimwiki_folding='expr'
let g:vimwiki_global_ext=0
let mapleader="\<Space>"

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown=0
let g:pandoc#biblio#use_bibtool=1
let g:pandoc#formatting#mode='hA'
let g:pandoc#formatting#textwidth=80

set omnifunc=syntaxcomplete#Complete

"Airline
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set laststatus=2
"set ttimeoutlen=50
"AutoSave
"let g:auto_save = 1

syntax on
set autochdir
set clipboard=unnamed
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set backspace=indent,eol,start
set t_Co=16
"https://unix.stackexchange.com/questions/139578/copy-paste-for-vim-is-not-working-when-mouse-set-mouse-a-is-on
set mouse=r

"Mappings for expand-region.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"https://danielmiessler.com/study/vim/
inoremap jk <ESC>

"http://www.viemu.com/a-why-vi-vim.html
set hlsearch

"Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

"Move between windows using CTRL+VIM navigation keys.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_vimwiki = {
    \ 'ctagstype': 'vimwiki',
    \ 'ctagsbin' : $HOME . '/bin/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"easy way to save a file with <Space>w
"http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <Leader>w :w<CR>

set nocompatible
filetype plugin on


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'w0rp/ale'
"Bundle 'vimwiki'
"Bundle 'taskwiki'
Bundle 'vim-expand-region'
Bundle 'rking/ag.vim'
Bundle 'mattn/calendar-vim'
"Bundle 'vim-auto-save'
Bundle 'tagbar'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-pandoc-syntax'
Bundle 'vim-pandoc/vim-pandoc-after'
Bundle 'dhruvasagar/vim-table-mode'
"Bundle 'nvie/vim-flake8'
"Bundle 'jiangmiao/auto-pairs'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'rstacruz/vim-closer'
Bundle 'tpope/vim-endwise'
Bundle 'yggdroot/indentLine'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'benmills/vimux'

call vundle#end()

filetype plugin indent on
set background=dark
colorscheme solarized

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<CR>
:autocmd FileType vimwiki set spell spelllang=en_us
:autocmd FileType markdown map <leader>c :call ToggleCalendar()<CR>
:autocmd FileType markdown set spell spelllang=en_us
:autocmd FileType pandoc map <leader>c :call ToggleCalendar()<CR>
:autocmd FileType pandoc set spell spelllang=en_us
:autocmd FileType markdown.pandoc map <leader>c :call ToggleCalendar()<CR>
:autocmd FileType markdown.pandoc set spell spelllang=en_us
:autocmd BufNewFile,BufRead *.md filetype plugin indent off
:autocmd BufNewFile,BufRead,BufFilePRe *.md set filetype=markdown.pandoc
:autocmd BufNewFile,BufRead,BufFilePRe *.md setlocal wrap textwidth=80
":autocmd BufWritePost *.py call Flake8()
au FileType markdown setlocal wrap textwidth=80
au FileType vimwiki setlocal wrap textwidth=80
au FileType pandoc setlocal wrap textwidth=80
au FileType pandoc setlocal fo+=t

autocmd InsertEnter * setlocal concealcursor=
autocmd InsertLeave * setlocal concealcursor=inc
let g:indentLine_noConcealCursor=""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" https://blog.bugsnag.com/tmux-and-vim/
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
