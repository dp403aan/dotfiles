
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

set encoding=utf-8                " Use utf-8 for encoding
set history=2000                  " Keep 2000 lines of command line history
set ignorecase smartcase          " Overrides ignorecase if your pattern contains mixed case
set incsearch                     " Highlight the searching string while typing (ctrl+g, ctrl+t)
set noswapfile                    " Disable swap file
set number                        " Always show line numbers
set ruler                         " Show the cursor position all the time
set scrolloff=2                   " Two lines from the top or bottom while scrolling
set showcmd                       " Show command being executed
set showmatch                     " Cursor shows matching ) and }
set showmode                      " Show current mode
set tabstop=4                     " Number of spaces that a <Tab> in the file counts for

filetype plugin indent on         " Enable detection, plugins and indenting in one step
syntax on                         " Syntax highlight

" Abbrevations
""""""""""""""
iabbrev @@ dp403aan@gmail.com

" Mappings
""""""""""
" map zz to esc
inoremap zz <esc>

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null 

" Misc
""""""
autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0

