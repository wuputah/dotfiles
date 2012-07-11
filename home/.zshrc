# vim:ft=sh:

DOTFILES=$(dirname $(dirname $(readlink $HOME/.zshrc)))

source $DOTFILES/sh/env
source $DOTFILES/zsh/config
source $DOTFILES/sh/aliases

for file in .lightning/functions.sh \
            .zshrc.local \
            .cinderella.profile
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done
