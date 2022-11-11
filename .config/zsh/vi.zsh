# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  # export EDITOR='vim'
# else
  export EDITOR='nvim'
# fi
bindkey -v
bindkey -M vicmd 'V' edit-command-line # this remaps `vv` to `V` (but overrides `visual-mode`)
KEYTIMEOUT=1

export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true

