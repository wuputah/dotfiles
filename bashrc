# Import the global profile
source /etc/profile
# Git completion
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
  source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi

source ~/bin/dotfiles/sh/env
source ~/bin/dotfiles/bash/colors
source ~/bin/dotfiles/bash/config
source ~/bin/dotfiles/sh/aliases
source ~/bin/dotfiles/bash/functions
