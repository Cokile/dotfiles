#!/usr/bin/env bash

set -e

# install Homebrew if needed
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi
echo "Homebrew is installed."

# install packages in Brewfile if needed
## use python3 as the check, since we need it to install dotbot
if [[ $(brew list | grep python@3) == "" ]]; then
    echo "Insatlling packages..."
    brew bundle --file=homebrew/Brewfile
fi
echo "Packages are installed."

