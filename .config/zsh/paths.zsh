export GIT_USER=ramilito
export PATH=$PATH:~/.yarn/bin/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.istioctl/bin
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:$HOME/.linkerd2/bin
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprpc
export GO111MODULE=on
export AWS_PROFILE="ramilito"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="$PATH:/home/$USER/.dotnet"
export PATH="$PATH:/home/$USER/.cargo/bin"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:$HOME/.kube/kubediff"
export PATH="$PATH:$HOME/.dotnet/tools"
export KUBECONFIG=$(for file in $(find ~/.kube -maxdepth 1 -type f); do echo -n ":$file"; done)
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$PATH:/Applications/Wezterm.app/Contents/MacOS"
fi

export AWS_DEFAULT_OUTPUT="yaml"
export AWS_PAGER="yq"
export SKIP_HUSKY=1

