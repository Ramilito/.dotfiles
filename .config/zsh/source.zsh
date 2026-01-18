zsh-defer source "$HOME/.cargo/env"

zsh-defer source $ZSH/plugins/kubectl/kubectl.plugin.zsh
zsh-defer source $ZSH/plugins/docker/docker.plugin.zsh
zsh-defer source $ZSH/plugins/terraform/terraform.plugin.zsh

eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

eval "$(direnv hook zsh)"

eval ". <(flux completion zsh)"
eval "$(kubesess init bash)"
