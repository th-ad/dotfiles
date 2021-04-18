PROMPT='%n %. > '

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
