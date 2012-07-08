"""""""""""" GENERAL """"""""""""""

set nocompatible
" gutter
set number ruler
" whitespace
set nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent
" whitespace fill characters
set list listchars=tab:\ \ ,trail:·
" searching
set hlsearch incsearch ignorecase smartcase
" status bar
set laststatus=2
" min number of lines at top/bottom of window
set scrolloff=3
" swap files and undo files
set dir=~/.vim/backup backupdir=~/.vim/backup
" make it fast
set ttyfast
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" allow plugins to set identation
filetype plugin indent on
" show (partial) command in the status line
set showcmd
" use modeline overrides
set modeline modelines=10

" tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,vendor/gems/*,.bundle/*,vendor/bundle/*

" colors/colorscheme
syntax on
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


"""""""""""" FILETYPE """"""""""""""

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79


"""""""""""" MAPPINGS """"""""""""""
map Y y$
map <Leader>w :bd<CR>

" set showmatch " Show matching brackets
" set mat=3     " Bracket blinking

autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" F keys
map <F1> :noh<cr>
map <F2> :NERDTreeToggle<cr>
set pastetoggle=<F3>

" C-a and C-e in all modes
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
nnoremap <C-a> ^
vnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-e> $

" always use 'very magic' mode (i.e. full regexps)
nnoremap / /\v
vnoremap / /\v

" map jj to esc in insert mode as well as C-j
imap jj <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" Quick-open .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc.local<cr>
nnoremap <leader>rl :so ~/.vimrc.local<cr>

" Open a split, switch over to it
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>v <C-w>v<C-w>l

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map w :w<cr>
map q :q<cr>
map t :CommandT<cr>
map T :CommandTFlush<cr>:CommandT<cr>
map F :Ack<space>

map <leader>ta :Tabularize /\|<cr>

" Tab mappings
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

""""""""""""""""" AUTOCMD """""""""""""""""""

" remember last location in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  if exists("b:stripWhitespace") && b:stripWhitespace == 1
    " create a mark to return to
    normal mZ
    %s/\s\+$//e   " strip whitespace from end of lines
    %s/\n\+\%$//e " strip extra newlines from EOF
    if line("'Z") != line(".")
      echo "Stripped whitespace\n"
    endif
    " if the mark we created is beyond EOF, go to EOF
    if line("'Z") > line("$")
      normal G
    else
      normal `Z
    endif
  endif
endfunction
autocmd FileType * let b:stripWhitespace = 0
autocmd FileType ruby,eruby,javascript,css,html,markdown,textile let b:stripWhitespace = 1
autocmd BufWritePre * call StripTrailingWhitespace()
