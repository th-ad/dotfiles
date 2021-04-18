# This file (.bash_profile) is read when you login to a machine
# The .bashrc is read when a shell is started.  We're basically 
# going to use one file.  But, if you feel the need, you could
# separate some functionality

source ~/.zshrc

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

export PATH=/usr/local/bin:$PATH
