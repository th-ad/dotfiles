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

# Setup NexHealth Kubeconfig
export KUBECONFIG=/Users/thad/.kube/nexhealth-eks/nexhealth-aggregate-kubeconfig

alias k9s='k9s --kubeconfig ${KUBECONFIG}'

alias nvim=lvim
export EDITOR='lvim'
