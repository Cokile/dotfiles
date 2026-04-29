#!/usr/bin/env bash

set -e

FISH_PATH=$(command -v fish)

# set fish as default shell
if ! grep -qxF "$FISH_PATH" /etc/shells; then
    echo "Adding $FISH_PATH to /etc/shells..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
fi

CURRENT_SHELL=$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')
if [[ "$CURRENT_SHELL" != "$FISH_PATH" ]]; then
    echo "Setting fish as default shell..."
    chsh -s "$FISH_PATH"
fi
echo "Fish is the default shell."

# change theme
echo "Changing fish theme..."
fish -c 'yes | fish_config theme save gruvbox-material'
echo "Fish theme changed."

# install plugins
if ! fish -c 'functions -q fisher' 2>/dev/null; then
    echo "Installing fisher..."
    fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'
fi
echo "Updating fish plugins..."
fish -c 'fisher update'
echo "Fish plugins installed."

