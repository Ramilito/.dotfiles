export NVM_LAZY_LOAD=true
export NVM_NO_USE=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim')

plugins=(git vi-mode fzf-tab)
plugins+=(zsh-nvm)
plugins+=(zsh-autosuggestions zsh-completions)
plugins+=(docker kubectl terraform)
# plugins+=(gcloud aws)

