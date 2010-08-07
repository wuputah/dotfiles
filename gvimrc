if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<Enter>
endif

" 256 colors
set t_Co=256
set go-=T
