let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1

"Remove markdown and vimwiki types from YCM blacklist.
    let g:ycm_filetype_blacklist = {
          \ 'tagbar' : 1,
          \ 'qf' : 1,
          \ 'notes' : 1,
          \ 'unite' : 1,
          \ 'text' : 1,
          \ 'pandoc' : 1,
          \ 'infolog' : 1,
          \ 'mail' : 1
          \}

"Don't let vimwiki clobber YCM's <Tab> mapping.
let g:vimwiki_table_mappings = 0

let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.wiki': 'default'}
let g:vimwiki_folding='expr'
let mapleader="\<Space>"
syntax on
set autochdir
set clipboard=unnamed
set number
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start
set t_Co=16

"Mappings for expand-region.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"easy way to save a file with <Space>w
"http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
nnoremap <Leader>w :w<CR>

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vimwiki'
Bundle 'taskwiki'
Bundle 'vim-expand-region'
Bundle 'rking/ag.vim'
Bundle 'mattn/calendar-vim'

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
:autocmd CursorHold,CursorHoldI * update
