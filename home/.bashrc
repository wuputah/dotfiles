# vim:ft=sh:

# Import the global profile
source /etc/profile
# Git completion
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
  source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi


DOTFILES=$(dirname $(dirname $(readlink $HOME/.bashrc)))

source $DOTFILES/sh/env
source $DOTFILES/bash/colors
source $DOTFILES/bash/config
source $DOTFILES/sh/aliases
source $DOTFILES/bash/functions

for file in .lightning/functions.sh \
            .bashrc.local
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done

echo 'Why are you using bash?'
echo '$ chsh -s $(which zsh)'
