#!/usr/bin/env bash

set -e

function display_usage {
    echo "Usage: $0 [-bh]" >&2
    echo "-b: Run bootstrap.[pre|post].sh"
    echo "-h: Display usage"
}

# execute scripts with given name($0) in all direct subdirectories
function run_install_scripts {
    for file in $(find . -not -iwholename '*.git*' -maxdepth 2 -type f -name $1)
    do
        echo "+++++Executing $file+++++"
        source $file
        echo -e "-----Executed $file------\n"
    done
}

# and then install dotfiles with dotbot
function install_dotfiles {
    # install dotbot with pip3 if needed first
    if [[ $(command -v dotbot) == "" ]]; then
        pip3 install dotbot
        echo
    fi
    echo '+++++++Installing dotfiles+++++++'
    dotbot -c install.conf.yaml
    echo -e '-----Dotfiles are installed------\n'
}


# parse options
BOOTSTRAP='false'
while getopts "bh" opt; do
  case $opt in
    b)
        BOOTSTRAP='true'
        ;;
    h)
        display_usage
        exit 0
        ;;
    *)
        display_usage
        exit 1
        ;;
  esac
done
# remove all options processed by getopts
shift $(( OPTIND - 1 ))
[[ "${1}" == "--" ]] && shift


# main
if $BOOTSTRAP; then
    run_install_scripts 'bootstrap.pre.sh'
fi
install_dotfiles
if $BOOTSTRAP; then
    run_install_scripts 'bootstrap.post.sh'
    echo "Now quit your terminal and enjoy your journey with Alacritty + fish + NeoVim ;-)"
fi

