# VARIABLES
## key bindings
set fish_key_bindings fish_user_key_bindings


# EXPORTS
set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx MANPAGER 'nvim +Man!'

## homebrew
if test (uname -m) = arm64
    set -gx BREW_PATH /opt/homebrew
else
    set -gx BREW_PATH /usr/local
end
fish_add_path -gm $BREW_PATH/bin

## go
set -gx GOPATH ~/go
fish_add_path -gm $GOPATH/bin

## ruby
set -gx RUBY_PATH $BREW_PATH/opt/ruby
fish_add_path -gm $RUBY_PATH/bin
fish_add_path -gm $BREW_PATH/lib/ruby/gems/*/bin

## rust
set -gx CARGO_HOME ~/.cargo
fish_add_path -gm $CARGO_HOME/bin
if command -q rustc; and not set -q RUST_SRC_PATH
    set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library
end

## colors
if command -q gdircolors; and status is-interactive
    gdircolors -c ~/.gruvbox.dircolors | source
end


# =============================================================================
# EVERYTHING BELOW IS FOR INTERACTIVE SHELLS ONLY
# =============================================================================
status is-interactive; or return


# TMUX
if test -z "$TMUX"; and test -n "$ALACRITTY_SOCKET"
    set -l client_count (tmux list-clients 2>/dev/null | wc -l | string trim)
    if test "$client_count" -eq 0
        tmux attach 2>/dev/null; or tmux -2
    end
end


# ALIASES
alias et=exit
alias xo='xed .'


# APPS
## bat
alias cat=bat

## eza
alias ls=eza
alias la='eza -al'
alias tree='eza -T -L=2'

## fd
alias find=fd

## fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS '
--cycle
--border
--height=90%
--layout=reverse
--preview-window=wrap
--marker=">"
--color=fg:#968977,bg:#f2e5bc,hl:#b47109
--color=fg+:#968977,bg+:#f2e5bc,hl+:#b47109
--color=info:#6c782e,prompt:#968977,pointer:#968977
--color=marker:#6c782e,spinner:#945e80,header:#4c7a5d
'

## fzf.fish
set fzf_fd_opts --hidden --follow --exclude=.git
set fzf_preview_dir_cmd 'eza -al --color=always'
fzf_configure_bindings --directory=\cf

## git
alias g=git
alias gti=git
alias gi=git
alias gt=git

# lazygit
alias lag='lazygit --use-config-file=$HOME/.config/lazygit/config.yml'

## nvim
alias vim=nvim

## tig
alias t='tig --all'

if command -q zoxide
    function j --description 'zoxide jump (lazy-initialised)'
        functions --erase j
        zoxide init --cmd j fish | source
        j $argv
    end
end

