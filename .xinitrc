#!/bin/sh

session=${1}

case $session in
	dwm)
		GPG_TTY=$(tty)
		export GPG_TTY  # Fixes issue with gpg not prompting for passphrase 
		export _JAVA_AWT_WM_NONREPARENTING=1 # fixes issues with Intellij
		dwmblocks &
		picom --experimental-backends -b
		exec ~/scripts/startdwm 
		;;
	*)
		# Start gnome DE 
		. /etc/X11/Xsession
		;;
esac
