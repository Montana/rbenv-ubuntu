#!/bin/bash

## For Erika and I - 3.2.6 Setup for Single Shell Session (Ubuntu)

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Updating packages and installing prerequisites..."
sudo apt update -y
sudo apt install -y git build-essential libssl-dev zlib1g-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev autoconf bison libffi-dev

if ! command_exists rbenv; then
    echo "Installing rbenv..."
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - bash)"

    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo "rbenv installed successfully."
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
