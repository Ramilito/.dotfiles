alias homeserver="sudo sshfs -o allow_other,default_permissions,nonempty ubuntu@ubuntu.lan:/home/ubuntu/ /mnt/home-server"
alias config_lazy='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias k="kubectl"
alias k8s="nvim -c 'lua require(\"kubectl\").toggle({tab=true})'"
alias k8s_moshe="NVIM_APPNAME=nvim_moshe nvim -c 'lua require(\"kubectl\").toggle({tab=true})'"

alias cat=bat

alias claude-litellm='/Users/ramidaghlawi/workspace/podme/litellm/claude-code.sh'
