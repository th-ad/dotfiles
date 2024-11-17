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

alias ac=arduino-cli

# Nordic setup
export PATH=/opt/nordic/ncs/toolchains/20d68df7e5/bin:/opt/nordic/ncs/toolchains/20d68df7e5/usr/bin:/opt/nordic/ncs/toolchains/20d68df7e5/usr/local/bin:/opt/nordic/ncs/toolchains/20d68df7e5/opt/bin:/opt/nordic/ncs/toolchains/20d68df7e5/opt/nanopb/generator-bin:/opt/nordic/ncs/toolchains/20d68df7e5/opt/zephyr-sdk/aarch64-zephyr-elf/bin:/opt/nordic/ncs/toolchains/20d68df7e5/opt/zephyr-sdk/x86_64-zephyr-elf/bin:/opt/nordic/ncs/toolchains/20d68df7e5/opt/zephyr-sdk/arm-zephyr-eabi/bin:$PATH
export GIT_EXEC_PATH=/opt/nordic/ncs/toolchains/20d68df7e5/Cellar/git/2.37.3/libexec/git-core
export GIT_TEMPLATE_DIR=/opt/nordic/ncs/toolchains/20d68df7e5/Cellar/git/2.37.3/share/git-core/templates
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/opt/nordic/ncs/toolchains/20d68df7e5/opt/zephyr-sdk

# bun completions
[ -s "/Users/thad/.bun/_bun" ] && source "/Users/thad/.bun/_bun"
