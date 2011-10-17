source $HOME/bin/dotfiles/sh/env
source $HOME/bin/dotfiles/zsh/config
source $HOME/bin/dotfiles/sh/aliases

for file in .rvm/scripts/rvm \
            .lightning/functions.sh \
            .zshrc.local \
            .cinderella.profile
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done
