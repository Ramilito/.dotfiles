export NVM_LAZY_LOAD="true"
export NVM_LAZY=1
export NVM_NO_USE=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

plugins=(git vi-mode fzf-tab)
plugins+=(zsh-nvm)
plugins+=(brew)
plugins+=(zsh-autosuggestions zsh-completions)
plugins+=(docker kubectl terraform)
# plugins+=(gcloud aws)

