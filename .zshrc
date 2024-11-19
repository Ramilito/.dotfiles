# zmodload zsh/zprof
DISABLE_AUTO_UPDATE=true
source ~/zsh-defer/zsh-defer.plugin.zsh

export ZSH="$HOME/.oh-my-zsh"

source "$HOME/.config/zsh/plugins.zsh"
source $ZSH/oh-my-zsh.sh

zsh-defer -c 'nvm install 20.10'

source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/setopt.zsh"
source "$HOME/.config/zsh/paths.zsh"
source "$HOME/.config/zsh/prompt.zsh"
source "$HOME/.config/zsh/source.zsh"
source "$HOME/.config/zsh/vi.zsh"
source "$HOME/.config/zsh/secrets.zsh"

# zprof
