map Y y$
map <Leader>w :bd<CR>

set showmatch " Show matching brackets
set mat=3     " Bracket blinking

nnoremap <silent> <cr> :noh<cr>

" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
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
endfunction
autocmd BufWritePre *.rb,*.erb,Rakefile,*.rake,Gemfile,*.rjs,*.js,*.css,*.html,*.txt,*.markdown,*.textile :call StripTrailingWhitespace()
