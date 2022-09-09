# zmodload zsh/zprof
source ~/zsh-defer/zsh-defer.plugin.zsh

export ZSH="/home/$USER/.oh-my-zsh"
source "$HOME/.config/zsh/plugins.zsh"
source $ZSH/oh-my-zsh.sh

zsh-defer -c 'nvm install --lts'

source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/setopt.zsh"
source "$HOME/.config/zsh/paths.zsh"
source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/source.zsh"
source "$HOME/.config/zsh/vi.zsh"

# zprof
