function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
    if not set -q __fish_prompt_char
        set -g __fish_prompt_char ">>> "
    end

    set -l red (set_color brred)
    set -l yellow (set_color bryellow)
    set -l white (set_color brwhite)
    set -l cyan (set_color brcyan)
    set -l magenta (set_color brmagenta)

    set -l cwd (pwd | sed "s:^$HOME:~:")
    set -l user (whoami)

    if [ (_git_branch_name) ]
        if test (_git_branch_name) = "master"
            set -l git_branch (_git_branch_name)
            set git_info "$white($red$git_branch"
        else
            set -l git_branch (_git_branch_name)
            set git_info "$white($magenta$git_branch"
        end

        if [ (_is_git_dirty) ]
            set -l dirty "$yellow*"
            set git_info "$git_info$dirty$white)"
        else
            set git_info "$git_info$white)"
        end
    end

    echo -n $yellow$user":" $cyan$cwd $git_info
    echo
    echo -n $white$__fish_prompt_char
end

