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


fish_vi_key_bindings  # set vi-mode
# Environment variables (global + exported)
set -gx GPG_TTY $(tty)
set -gx EDITOR nvim

# Init the starship prompt
starship init fish | source
