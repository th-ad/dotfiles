# Dotfiles
These are a collection of dotfiles near and dear to my <3

Installation is made easy using [Dotbot](https://github.com/anishathalye/dotbot) and friends.

Generally it's not a good idea to blindly copy others dotfiles, but it can sometimes be useful as a starting point.

# Installation

1. Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Clone this repo and let the magic begin
```
git clone git@github.com:th-ad/dotfiles.git ~/dotfiles && cd ~/dotfiles
git submodule init && git submodule update
./install
```

It's that simple.
