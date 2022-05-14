#!/usr/bin/env bash

set -e

# setup packer.nvim
PACKER_PATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [[ ! -d "$PACKER_PATH" ]]; then
echo "Setting packer.nvim..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo "Packer.nvim set."
fi

# reminders
echo -e "\033[0;33m*****REMINDERS:*****\033[0m"
echo "1. DON'T FORGET TO RUN :checkhealth IN NEOVIM!"
echo -e "\033[0;33m********************\033[0m"

