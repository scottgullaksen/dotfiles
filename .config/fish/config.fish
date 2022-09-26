# disable fish login prompt
set -U fish_greeting

# aliases

abbr -a ls lsd
abbr -a l lsd -l
abbr -a la lsd -la
abbr -a lt lsd --tree

abbr -a mci mvn clean install
abbr -a mcp mvn clean package
abbr -a msr mvn spring-boot:run

abbr -a connect60 ssh -L 22224:sftpfilserveritas.oslofelles.oslo.kommune.no:22 internitas1systest -N

abbr -a k kubectl
abbr -a kdeploy k8s_helm_deploy.py
abbr -a kauth k8s-auth-client.sh
abbr -a ksc k8s-set-context.sh
abbr -a apt-manualinstalls "comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
abbr -a vpn nmcli --ask con up id # cool, because its an alias, but it can be expanded to the full command!

abbr -a copy xclip -sel clip
abbr -a cpass lpass show -cp
abbr -a tmps /home/scottg/scripts/temps

abbr -a passgen "tr -dc A-Za-z0-9 </dev/urandom | head -c"

fish_vi_key_bindings  # set vi-mode

# Environment variables (global + exported)
set -gx GPG_TTY $(tty)
set -gx EDITOR nvim

# Configure keybinds for fish fzf plugin
fzf_configure_bindings --directory=\ct --git_log=\cg --git_status=\cs --processes=\cp

# Init the starship prompt
# starship init fish | source
