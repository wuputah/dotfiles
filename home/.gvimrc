" disable all bells
set visualbell t_vb=

" change reload to load both
nnoremap <leader>rl :so ~/.vimrc<cr>:so ~/.gvimrc<cr>

" gvim
if !has("gui_macvim")
  set guifont=Terminess\ Powerline\ 10
  set guioptions-=m
  set guioptions-=T
  set listchars=tab:\ \ 
  map <a-s> :w<cr>
  map <a-w> :q<cr>
  map <a-t> :CommandT<cr>
  map <a-T> :CommandTFlush<cr>:CommandT<cr>
  map <a-F> :Ack<space>
endif

" macvim
if has("gui_macvim")
  set guifont=Anonymous\ Pro:h12
  map <leader>tt :CommandTFlush<cr>:CommandT<cr>

  nmap <D-[> <<
  nmap <D-]> >>
  vmap <D-[> <gv
  vmap <D-]> >gv

  " Textmate-style cmd+return
  inoremap <D-return> <C-o>o
  nnoremap <D-return> o<esc>
  vnoremap <D-return> o
  inoremap <D-S-return> <C-o>O
  nnoremap <D-S-return> O<esc>
  vnoremap <D-S-return> O
endif
