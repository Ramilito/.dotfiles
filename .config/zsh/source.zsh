zsh-defer source "$HOME/.cargo/env"
zsh-defer eval "$(fzf --zsh)"

if [[ $(uname) == "Darwin" && -n $(brew list kubesess 2>/dev/null) ]]; then
    HOMEBREW_PREFIX=$(brew --prefix)
    source ${HOMEBREW_PREFIX}/share/zsh/site-functions/kubesess.sh
    source ${HOMEBREW_PREFIX}/opt/kubesess/etc/bash_completion.d/completion.sh
else
    zsh-defer test -f ~/.kube/kubesess/scripts/sh/kubesess.sh && source ~/.kube/kubesess/scripts/sh/kubesess.sh
    zsh-defer test -f ~/.kube/kubesess/scripts/sh/completion.sh && source ~/.kube/kubesess/scripts/sh/completion.sh
fi

eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
