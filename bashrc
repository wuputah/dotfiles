# vim:ft=sh:

DOTFILES=$(dirname $(readlink -f $HOME/.bashrc))

# Import the global profile
source /etc/profile
# Git completion
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
  source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi

source $HOME/bin/dotfiles/sh/env
source $HOME/bin/dotfiles/bash/colors
source $HOME/bin/dotfiles/bash/config
source $HOME/bin/dotfiles/sh/aliases
source $HOME/bin/dotfiles/bash/functions

for file in .rvm/scripts/rvm \
            .lightning/functions.sh \
            .bashrc.local \
            .cinderella.profile
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done

echo 'Why are you using bash?'
echo '$ chsh -s $(which zsh)'
