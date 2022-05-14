#!/usr/bin/env bash

set -e

# set fish as default shell
if [[ $(cat /etc/shells | grep fish) == "" ]]; then
    FISH_PATH=$(command -v fish)
    echo "Setting fish as default shell..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi
echo "Fish is the default shell."

# change theme
echo "Changing fish theme..."
fish -c 'yes | fish_config theme save rei'
echo "Fish theme changed."

