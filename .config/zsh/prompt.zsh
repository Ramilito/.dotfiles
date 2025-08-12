autoload -Uz colors vcs_info
colors

function _update_kube_prompt() {
  local kube_ctx kube_ns icon color

  if (( $+commands[kubesess] )); then
    kube_ctx=$(kubesess -c context 2>/dev/null)
    kube_ns=$(kubesess -c namespace 2>/dev/null)
  fi

  case $kube_ctx in
    (*dev*|delivery|aks-podme-test) icon='❗'; color=$fg[yellow] ;;
    (*prod*|podme|*staging*)        icon='⛔'; color=$fg[red]    ;;
    (*)                             icon='✅'; color=$fg[green]  ;;
  esac

  PROMPT_KUBE="%{$color%}${icon}|${kube_ctx}%{$reset_color%}:%F{6}${kube_ns}%f"
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats        '%F{226}%b%f%u%c'
zstyle ':vcs_info:*' unstagedstr    ' %F{yellow}✗%f'

function _update_git_prompt() { vcs_info }

add-zsh-hook precmd _update_kube_prompt
add-zsh-hook precmd _update_git_prompt

PROMPT='%F{magenta}%~%f ${vcs_info_msg_0_} '
RPROMPT='${PROMPT_KUBE}'
