# Import the global profile
source /etc/profile

source ~/bin/dotfiles/sh/env
source ~/bin/dotfiles/zsh/config
source ~/bin/dotfiles/sh/aliases

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
