#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# ssh agent setup
keychain $HOME/.ssh/id_heroku
[ -f $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh 2>/dev/null
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && . $HOME/.keychain/$HOSTNAME-sh-gpg 2>/dev/null

xset +fp /usr/share/fonts/local
xset fp rehash

xrdb -merge $HOME/.Xresources
xmodmap $HOME/.Xmodmap

# run xprofile
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f $HOME/.xprofile ] && . $HOME/.xprofile

# launch WM
DEFAULT_SESSION=awesome
case $1 in
  openbox)
    exec openbox-session
    ;;
  awesome)
    exec awesome
    ;;
  xfce4)
    exec startxfce4
    ;;
  *)
    exec $DEFAULT_SESSION
    ;;
esac
