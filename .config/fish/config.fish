if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a la ls -la
abbr -a copy xclip -sel clip
abbr -a cpass lpass show -cp

fish_vi_key_bindings  # Enables vi-mode for the shell prompt!

starship init fish | source
