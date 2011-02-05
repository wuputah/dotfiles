If you were me, and you wanted your dotfiles, you would probably do the
following:

    bash < <(curl http://github.com/wuputah/dotfiles/raw/master/setup)

Make sure the following is installed first:

* rake
* git
* vim

It is then recommended you also install zsh, and do:

    chsh -s /bin/zsh
