#!/usr/bin/env bash

set -e

# install Homebrew if needed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Homebrew is installed."

# install packages in Brewfile if any are missing or outdated
if ! brew bundle check --file=homebrew/Brewfile >/dev/null 2>&1; then
    echo "Installing packages..."
    brew bundle --file=homebrew/Brewfile
fi
echo "Packages are installed."

