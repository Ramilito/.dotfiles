# zmodload zsh/zprof
setopt aliases

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
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
export NVM_COMPLETION=true
plugins=(git zsh-nvm you-should-use vi-mode fzf-tab)
plugins+=(zsh-autosuggestions zsh-completions)
# plugins+=(zsh-syntax-highlighting) 
plugins+=(docker kubectl terraform gcloud kubectx aws)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  # export EDITOR='vim'
# else
  export EDITOR='lvim'
# fi

alias homeserver="sudo sshfs -o allow_other,default_permissions,nonempty ubuntu@ubuntu.lan:/home/ubuntu/ /mnt/home-server"
alias k="kubectl"
alias kk="kubecolor"
alias Switch='export KUBECONFIG=$(~/kubesess/kubesess -- context):$HOME/.kube/config'
alias kn='export KUBECONFIG=$(~/kubesess/kubesess -- namespace):$HOME/.kube/config'
alias kdpt="kubectl get pods --all-namespaces -o wide | grep Terminated | awk '{print $1,$2}' | xargs -L1 kubectl delete pod -n"
# alias Unity="$HOME/Unity/Hub/Editor/2020.3.18f1/Editor/./Unity"

export GIT_USER=ramilito
export GIT_TOKEN=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
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
bindkey -v
bindkey -M vicmd 'V' edit-command-line # this remaps `vv` to `V` (but overrides `visual-mode`)
KEYTIMEOUT=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/home/$USER/.dotnet"
export PATH="$PATH:/home/$USER/.cargo/bin"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

export NVM_DIR="$HOME/.nvm"

if hash stern 2>/dev/null; then
    source <(stern --completion=zsh)
fi

source "$HOME/.cargo/env"

export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

timekubesess(){
  start=`date +%s.%N`
  for i in $(seq 1 20); do
    # export KUBECONFIG=$(~/kubesess/kubesess -- context "gke_toca-days-ops_us-central1-a_toca-days-delivery"):$HOME/.kube/config;
    # k get nodes;
    export KUBECONFIG=$(~/kubesess/kubesess -- context docker-desktop):$HOME/.kube/config;
    # k get nodes;
  done
  end=`date +%s.%N`
  echo time
  runtime=$( echo "$end - $start" | bc -l )
  echo $runtime
}

timekubectx(){
  start=`date +%s.%N`
  for i in $(seq 1 20); do 
    # kubectx "gke_toca-days-ops_us-central1-a_toca-days-delivery" > /dev/null 2>&1;
    # k get nodes;
    kubectx docker-desktop > /dev/null 2>&1; 
    # k get nodes;
  done
  end=`date +%s.%N`
  echo time
  runtime=$( echo "$end - $start" | bc -l )
  echo $runtime
}

dtf () {
  lazygit --git-dir="$HOME/.dotfiles" --work-tree="$HOME"
}