# vim:ft=sh:

DOTFILES=$(dirname $(dirname $(readlink $HOME/.zshrc)))

source $DOTFILES/sh/env
source $DOTFILES/zsh/config
source $DOTFILES/sh/aliases

for file in .lightning/functions.sh \
            .zshrc.local
do
  if [[ -s $HOME/$file ]]; then source $HOME/$file; fi
done

function _heroku_sudo_prompt() {
  sudo_active_prompt="sudo: "
  newline=$'\n'
  if [ -z "$HEROKU_API_KEY" ]; then
    return
  else
    if [ -z "$HEROKU_SUDO_SHELL_START" ]; then
      printf "$sudo_active_prompt${newline}"
    else
      if [ "$HEROKU_SUDO_SHELL_START" -gt 0 ]; then
        nwtime=`date +%s`
        hktimediff=`expr $nwtime - $HEROKU_SUDO_SHELL_START`
        hktimeleft=`expr $HEROKU_SUDO_TICKET_LIFE - $hktimediff`
        if [ $hktimediff -gt $HEROKU_SUDO_TICKET_LIFE ]; then
          printf "${sudo_active_prompt}EXPIRED${newline}"
        else
          printf "${sudo_active_prompt}${hktimeleft}s${newline}"
        fi
      else
          printf "$sudo_active_prompt${newline}"
      fi
    fi
  fi
}

alias hss="heroku sudo:run env HEROKU_SUDO_TICKET_LIFE=1800 HEROKU_SUDO_SHELL_START=\$(date +%s) zsh -li"
precmd() { _heroku_sudo_prompt }
