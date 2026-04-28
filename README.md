# dotfiles

Personal macOS development environment — managed with [dotbot](https://github.com/anishathalye/dotbot).

## Install

Fresh machine:

```sh
git clone https://github.com/<you>/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh -b
```

Re-link only (skip Homebrew, plugin installs, AppleScript icon swap, etc.):

```sh
./install.sh
```

`install.sh` does:

1. With `-b`, runs every `bootstrap.pre.sh` (Homebrew install + `brew bundle`).
2. Runs `dotbot -c install.conf.yaml` to symlink configs into place.
3. With `-b`, runs every `bootstrap.post.sh` (fish default shell + plugins, tmux TPM, neovim reminders, Alacritty icon swap).

All bootstrap scripts are idempotent — re-running `./install.sh -b` is safe.
