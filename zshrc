PROMPT='%n %. > '

source ~/.zprofile

# Reuse ssh-agent
/usr/local/bin/keychain $HOME/.ssh/thad.github.com &> /dev/null
source $HOME/.keychain/$HOST-sh &> /dev/null

# Remove all folders from desktop when not using
hide_desktop(){
	defaults write com.apple.finder CreateDesktop false
	killall Finder
}

# Bring all folders back to desktop
show_desktop(){
	defaults write com.apple.finder CreateDesktop true
	killall Finder
}

# Print current git branch name
git_branch() {
  git rev-parse --symbolic-full-name --abbrev-ref HEAD
}

export KUBECONFIG=~/.kube/config
export KUBE_CONFIG_PATH=~/.kube/config

alias k9s='k9s --kubeconfig ${KUBECONFIG}'

# alias nvim=lvim
# export EDITOR='lvim'
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# bun completions
[ -s "/Users/thad/.bun/_bun" ] && source "/Users/thad/.bun/_bun"

export DIRENV_LOG_FORMAT=""
export CANARY_DIR="$HOME/canary"
eval "$(direnv hook zsh)"
