export NVM_NO_USE=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')
zstyle ':omz:plugins:nvm' lazy yes

plugins=(git vi-mode fzf-tab)
plugins+=(nvm)
plugins+=(zsh-autosuggestions zsh-completions)
plugins+=(docker kubectl terraform)
# plugins+=(gcloud aws)

