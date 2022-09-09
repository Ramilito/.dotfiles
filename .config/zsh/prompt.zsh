prompt_context() {
    KUBE_CTX=$(kubesess -c context)
    KUBE_NS=$(kubesess -c namespace)

    if [[ $KUBE_CTX == *"dev"* ]]; then
      echo "(%{$fg[yellow]%}|$KUBE_CTX%{$reset_color%}:%F{6}$KUBE_NS%f)"
    elif [[ $KUBE_CTX == *"prod"* ]]; then
      echo "(%{$fg[red]%}|$KUBE_CTX%{$reset_color%}:%F{6}$KUBE_NS%f)"
    elif [[ $KUBE_CTX == *"staging"* ]]; then
      echo "(%{$fg[red]%}|$KUBE_CTX%{$reset_color%}:%F{6}$KUBE_NS%f)"
    else
      echo "(%{$fg[green]%}|$KUBE_CTX%{$reset_color%}:%F{6}$KUBE_NS%f)"
    fi
}

RPROMPT='$(prompt_context)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[226]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[magenta]%}%c%{$reset_color%} $(git_prompt_info)'

