zsh-defer source /usr/share/doc/fzf/examples/key-bindings.zsh
zsh-defer source /usr/share/doc/fzf/examples/completion.zsh

if hash stern 2>/dev/null; then
  source <(stern --completion=zsh)
fi

zsh-defer source "$HOME/.cargo/env"

zsh-defer test -f ~/.kube/kubesess/scripts/sh/kubesess.sh && source ~/.kube/kubesess/scripts/sh/kubesess.sh
zsh-defer test -f ~/.kube/kubesess/scripts/sh/completion.sh && source ~/.kube/kubesess/scripts/sh/completion.sh
