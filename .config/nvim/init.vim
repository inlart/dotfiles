"  _       _            _
" (_)     | |          | |
"  _ _ __ | | __ _ _ __| |
" | | '_ \| |/ _` | '__| __|
" | | | | | | (_| | |  | |
" |_|_| |_|_|\__,_|_|   \__|
"


" use vim-plug to manage plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'    " file system explorer
Plug 'itchyny/lightline.vim' " statusline
Plug 'itchyny/vim-gitbranch' " git branch in statusline
Plug 'junegunn/fzf'          " fuzzy finder

call plug#end()

syntax on                    " enable highlighting
set encoding=utf-8           " set encoding to utf-8
set expandtab                " insert spaces instead of tabs
set shiftwidth=4             " four spaces indentation
set tabstop=4                " insert four spaces for a tab
set laststatus=2             " show lightline
set mouse=a                  " enable mouse
set termguicolors            " enable true colors
set noswapfile               " disable swap file
set linebreak                " soft wrap
set number                   " display line number
set relativenumber           " relative line numbers
set ignorecase               " do case insensitive search
set clipboard+=unnamedplus   " set clipboard

" change line number highlight
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

cmap w!! w !sudo tee > /dev/null %

"
" lightline
"
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

"
" nerdtree
"
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

"
" fzf
"

nnoremap <silent> <C-t> :FZF<CR>

