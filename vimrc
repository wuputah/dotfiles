call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
filetype on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set autowrite
set ruler
set nu      " line numbers
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-20.(%)\%h%m%r%=%-40(%n%Y%)\%P
set foldmethod=syntax
set foldlevel=100

colorscheme vividchalk

let g:CommandTMaxHeight=20

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set showmatch " Show matching brackets
set mat=5 " Bracket blinking
