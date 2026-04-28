#!/usr/bin/env bash

set -e

FISH_PATH=$(command -v fish)

# set fish as default shell
if [[ $(cat /etc/shells | grep fish) == "" ]]; then
    echo "Setting fish as default shell..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi
echo "Fish is the default shell."

# change theme
echo "Changing fish theme..."
fish -c 'yes | fish_config theme save rei'
echo "Fish theme changed."

# install plugins
echo "Installing fish plugings..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update
echo "Fish plugins installed"

