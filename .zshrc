# zmodload zsh/zprof
source ~/zsh-defer/zsh-defer.plugin.zsh

setopt aliases
setopt TRANSIENT_RPROMPT
export ZSH="/home/$USER/.oh-my-zsh"

HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export NVM_LAZY_LOAD=true
export NVM_NO_USE=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('lvim')
plugins=(git vi-mode fzf-tab)
plugins+=(zsh-nvm)
plugins+=(zsh-autosuggestions zsh-completions)
plugins+=(docker kubectl terraform)
# plugins+=(gcloud aws)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  # export EDITOR='vim'
# else
  export EDITOR='lvim'
# fi

alias homeserver="sudo sshfs -o allow_other,default_permissions,nonempty ubuntu@ubuntu.lan:/home/ubuntu/ /mnt/home-server"
alias config="lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias k="kubectl"
alias kk="kubecolor"
alias kdpt="kubectl get pods --all-namespaces -o wide | grep Terminated | awk '{print $1,$2}' | xargs -L1 kubectl delete pod -n"

export GIT_USER=ramilito
export PATH=$PATH:~/.yarn/bin/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.istioctl/bin
export PATH="$HOME/.local/bin:$PATH"
export KUBECONFIG=$HOME/.kube/config
export PATH=$PATH:$HOME/.linkerd2/bin
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprpc
export GO111MODULE=on
export AWS_PROFILE="ramilito"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
bindkey -v
bindkey -M vicmd 'V' edit-command-line # this remaps `vv` to `V` (but overrides `visual-mode`)
KEYTIMEOUT=1

export PATH="$PATH:/home/$USER/.dotnet"
export PATH="$PATH:/home/$USER/.cargo/bin"

zsh-defer source /usr/share/doc/fzf/examples/key-bindings.zsh
zsh-defer source /usr/share/doc/fzf/examples/completion.zsh

export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:/home/$USER/.kube/kubediff"

if hash stern 2>/dev/null; then
    source <(stern --completion=zsh)
fi

zsh-defer source "$HOME/.cargo/env"

export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true

zsh-defer test -f ~/.kube/kubesess/scripts/sh/kubesess.sh && source ~/.kube/kubesess/scripts/sh/kubesess.sh
zsh-defer test -f ~/.kube/kubesess/scripts/sh/completion.sh && source ~/.kube/kubesess/scripts/sh/completion.sh

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

RPROMPT+='$(prompt_context)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[226]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[magenta]%}%c%{$reset_color%} $(git_prompt_info)'

# vd() {
# 	viddy -d -n 1 --shell zsh  "$(which $1 | cut -d' ' -f 4-)"
# }

zsh-defer -c 'nvm install --lts'

# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }

# zprof
