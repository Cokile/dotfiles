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
## a rubust way may be using `brew list | grew python@3` but `brew list` would take too much time to run
if [[ $(command -v pip3) == "" ]]; then
    echo "Insatlling packages..."
    brew bundle
fi
echo "Packages are installed."

