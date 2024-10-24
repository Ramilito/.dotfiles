
if [[ $OSTYPE == 'darwin'* ]]; then
  zsh-defer source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
  zsh-defer source "/opt/homebrew/opt/fzf/shell/completion.zsh"
else
  zsh-defer source /usr/share/doc/fzf/examples/key-bindings.zsh
  zsh-defer source /usr/share/doc/fzf/examples/completion.zsh
fi

if hash stern 2>/dev/null; then
  source <(stern --completion=zsh)
fi

zsh-defer source "$HOME/.cargo/env"

if [[ $(uname) == "Darwin" && -n $(brew list kubesess 2>/dev/null) ]]; then
    HOMEBREW_PREFIX=$(brew --prefix)
    source ${HOMEBREW_PREFIX}/share/zsh/site-functions/kubesess.sh
    source ${HOMEBREW_PREFIX}/opt/kubesess/etc/bash_completion.d/completion.sh
else
    zsh-defer test -f ~/.kube/kubesess/scripts/sh/kubesess.sh && source ~/.kube/kubesess/scripts/sh/kubesess.sh
    zsh-defer test -f ~/.kube/kubesess/scripts/sh/completion.sh && source ~/.kube/kubesess/scripts/sh/completion.sh
fi

eval "$(zoxide init --cmd cd zsh)"
