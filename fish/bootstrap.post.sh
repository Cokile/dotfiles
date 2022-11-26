#!/usr/bin/env bash

set -e

FISH_PATH=$(command -v fish)
SHARE_PATH=/opt/share/bin

# set fish as default shell
if [[ $(cat /etc/shells | grep fish) == "" ]]; then
    echo "Setting fish as default shell..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    chsh -s "$FISH_PATH"
fi
echo "Fish is the default shell."

# symlink fish to /opt/share/bin
# so we can use /opt/share/bin/fish for alacritty on M1 and Intel
if [[ ! -d $SHARE_PATH ]]; then
    echo "Creating $SHARE_PATH..."
    sudo mkdir -p "$SHARE_PATH"
fi
if [[ ! -L $SHARE_PATH/fish ]]; then
    echo "Linking fish to $SHARE_PATH..."
    sudo ln -s "$FISH_PATH" "$SHARE_PATH/fish"
fi
echo "Fish is linked to $SHARE_PATH."

# change theme
echo "Changing fish theme..."
fish -c 'yes | fish_config theme save rei'
echo "Fish theme changed."

# install plugins
echo "Installing fish plugings..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher update
echo "Fish plugins installed"

