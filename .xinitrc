#!/bin/sh

# TODO: Document what this does
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f /etx/xprofile ] && . /etc/profile
[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap no
GPG_TTY=$(tty)
export GPG_TTY  # Fixes issue with gpg not prompting for passphrase 
export _JAVA_AWT_WM_NONREPARENTING=1 # fixes issues with Intellij
dwmblocks &
picom --experimental-backends -b
exec ~/scripts/startdwm
