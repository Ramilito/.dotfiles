autoload -Uz colors vcs_info
colors

function _update_kube_prompt() {
  local kube_ctx kube_ns icon color ec1 ec2 ctx_l ns_part

  kube_ctx=$(kubesess -c context 2>/dev/null); ec1=$?
  kube_ns=$(kubesess -c namespace 2>/dev/null); ec2=$?

  if (( ec1 || ec2 )); then
    PROMPT_KUBE="%F{red}⚠ kubesess: error%f"
    return
  fi

  ctx_l=${(L)kube_ctx}
  case $ctx_l in
    (*dev*|delivery|aks-podme-test) icon='❗'; color=$fg[yellow] ;;
    (*prod*|podme|*staging*)        icon='⛔'; color=$fg[red]    ;;
    (*)                             icon='✅'; color=$fg[green]  ;;
  esac

  ns_part=""
  [[ -n $kube_ns ]] && ns_part=":%F{6}${kube_ns}%f"

  PROMPT_KUBE="%{$color%}${icon}|${kube_ctx}%{$reset_color%}${ns_part}"
}

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats        '%F{226}%b%f%u%c'
zstyle ':vcs_info:*' unstagedstr    ' %F{yellow}✗%f'

function _update_git_prompt() { vcs_info }

add-zsh-hook precmd _update_kube_prompt
add-zsh-hook precmd _update_git_prompt

PROMPT='%F{magenta}%~%f ${vcs_info_msg_0_} '
RPROMPT='${PROMPT_KUBE}'
