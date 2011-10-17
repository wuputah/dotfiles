set t_Co=256
colorscheme molokai

map Y y$
map <Leader>w :bd<CR>

" set showmatch " Show matching brackets
" set mat=3     " Bracket blinking

" Swap files and undo files
set dir=~/tmp,/var/tmp,/tmp,.
set autoindent
set scrolloff=3 " min number of lines at top/bottom of window
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
set ttyfast

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
