call plug#begin('~/local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

call plug#end()

syntax on
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set laststatus=2
set mouse=a
set termguicolors
set background=dark
set noswapfile
set linebreak
set number
set relativenumber
set ignorecase
set clipboard=unnamedplus

set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

cmap w!! w !sudo tee > /dev/null %

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
