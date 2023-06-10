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

abbr -a cpass lpass show -cp

abbr -a passgen "tr -dc A-Za-z0-9 </dev/urandom | head -c"

abbr -a n nvim

abbr -a mci mvn clean install
abbr -a k kubectl

fish_vi_key_bindings  # set vi-mode

# Environment variables (global + exported)
set -gx EDITOR nvim

# Configure keybinds for fish fzf plugin
# Note that the shell variables feature is not bound to any keybinding
fzf_configure_bindings --directory=\ct --git_log=\cg --git_status=\cs --processes=\cp --variables=

# PATH
fish_add_path $HOME/bin
fish_add_path /usr/local/bin

# Enable zoxide (https://github.com/ajeetdsouza/zoxide) for the fish shell
# zoxide init fish | source

kubectl completion fish | source
