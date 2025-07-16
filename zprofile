export PATH=/usr/local/bin:$PATH
eval $(/opt/homebrew/bin/brew shellenv)

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export LDFLAGS=
eval "$(rbenv init -)"

# Python setup
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# eval "$(pyenv init -)"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/thad/.dotnet/tools"
