# disable fish login prompt
set -U fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases

abbr -a ls lsd
abbr -a l lsd -l
abbr -a la lsd -la
abbr -a lt lsd --tree

abbr -a copy xclip -sel clip
abbr -a cpass lpass show -cp
abbr -a tmps /home/scottg/scripts/temps

abbr -a passgen "tr -dc A-Za-z0-9 </dev/urandom | head -c"

abbr -a bt bluetoothctl

alias ua-drop-caches 'sudo paccache -rk3; yay -Sc --aur --noconfirm'
abbr ua-update-all 'set -gx TMPFILE (mktemp); \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm'

fish_vi_key_bindings  # set vi-mode

# Environment variables (global + exported)
set -gx GPG_TTY $(tty)
set -gx EDITOR nvim

# Configure keybinds for fish fzf plugin
# Note that the shell variables feature is not bound to any keybinding
fzf_configure_bindings --directory=\ct --git_log=\cg --git_status=\cs --processes=\cp --variables=

# PATH
fish_add_path $HOME/bin

# Enable zoxide (https://github.com/ajeetdsouza/zoxide) for the fish shell
zoxide init fish | source

# Init the starship prompt
# starship init fish | source
