alias homeserver="sudo sshfs -o allow_other,default_permissions,nonempty ubuntu@ubuntu.lan:/home/ubuntu/ /mnt/home-server"
# alias config='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias k="kubectl"
alias kk="kubecolor"
alias kdpt="kubectl get pods --all-namespaces -o wide | grep Terminated | awk '{print $1,$2}' | xargs -L1 kubectl delete pod -n"

