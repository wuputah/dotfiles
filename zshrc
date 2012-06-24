# vim:ft=sh:

DOTFILES=$(dirname $(readlink -f $HOME/.zshrc))

source $DOTFILES/sh/env
source $DOTFILES/zsh/config
source $DOTFILES/sh/aliases

for file in .rvm/scripts/rvm \
            .lightning/functions.sh \
            .zshrc.local \
            .cinderella.profile
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done
