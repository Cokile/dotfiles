#!/usr/bin/env bash

set -e

# setup tpm
TPM_PATH="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$TPM_PATH" ]]; then
echo "Setting tpm..."
git clone https://github.com/tmux-plugins/tpm "$TPM_PATH"
echo "tpm set."
fi

# reminders
echo -e "\033[0;33m*****REMINDERS:*****\033[0m"
echo "1. DON'T FORGET TO INSTALL TMUX PLUGINS WITH <PREFIX>+I!"
echo -e "\033[0;33m********************\033[0m"

