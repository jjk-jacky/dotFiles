" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set nocompatible

call pathogen#infect()

"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'

colorscheme herald
filetype plugin indent on
syntax on

set mouse=a         " mouse stuff
set tabstop=4       " one tab is 4 spaces
set shiftwidth=4    " nb of spaces for autoindenting
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set copyindent      " copy previous indent on autoindent
set showmode
set showcmd
set hidden

set nowrap
set textwidth=80
set colorcolumn=80
set formatoptions+=t

" to paste w/out autoindent & shit
set pastetoggle=<F12>

set cursorline      " highlight cursor line
set ruler
set relativenumber  " count lines away from current one

set laststatus=2

set ignorecase
set smartcase
set hlsearch
set incsearch

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set titlestring=vim\ %<%F%(\ %)%m%h%w
set title

" to write file using sudo
cmap w!! w !sudo tee % >/dev/null

let mapleader=";"
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" taglist: only show tags for current file/buffer
let Tlist_Show_One_File=1

