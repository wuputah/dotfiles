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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
