#!/bin/bash

## For macOS

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

if ! command_exists rbenv; then
    echo "Installing rbenv and ruby-build..."
    brew install rbenv ruby-build
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
else
    echo "rbenv is already installed."
fi

if ! rbenv versions | grep -q "3.2.6"; then
    echo "Installing Ruby 3.2.6..."
    rbenv install 3.2.6
else
    echo "Ruby 3.2.6 is already installed."
fi

echo "Setting Ruby 3.2.6 for the current session..."
rbenv shell 3.2.6

DIRECTORY="example_directory"
echo "Creating directory: $DIRECTORY..."
mkdir -p "$DIRECTORY"

echo "Setup complete! Ruby 3.2.6 is active for this session, and '$DIRECTORY' has been created."
