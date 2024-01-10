# VARIABLES 
## key bindings
set fish_key_bindings fish_user_key_bindings


# EXPORTS
set -gx LANG en_US.UTF-8
set -x EDITOR nvim
set -x MANPAGER 'nvim +Man!'

## homebrew
if [ (uname -m) = 'arm64' ]
    set -x BREW_PATH /opt/homebrew
else
    set -x BREW_PATH /usr/local
end
set -x PATH $BREW_PATH/bin $PATH

## go
set -x GOPATH ~/go
set -x PATH $GOPATH/bin $PATH

## ruby
set -x RUBY_PATH $BREW_PATH/opt/ruby
set -x GEM_HOME $BREW_PATH/lib/ruby/gems/3.3.0
set -x PATH $RUBY_PATH/bin $PATH
set -x PATH $GEM_HOME/bin $PATH

## rust
set -x CARGO_HOME ~/.cargo
set -x PATH $CARGO_HOME/bin $PATH
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

## colors
eval (gdircolors -c ~/.gruvbox.dircolors)


# ALIASES
alias et=exit
alias xo='xed .'


# APPS
## bat
alias cat=bat

## exa
alias tree='exa -T -L=2'
alias la='exa -al'

## fd
alias find=fd

## fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -x FZF_DEFAULT_OPTS '
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
set fzf_preview_dir_cmd exa -al --color=always
fzf_configure_bindings --history=\e\cr --variables=\e\cv

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

## z.lua
alias jf='j -I'

