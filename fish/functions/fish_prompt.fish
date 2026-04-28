function _git_branch_name
    command git symbolic-ref --short HEAD 2>/dev/null
end

function _is_git_dirty
    set -l changes (command git status --porcelain --ignore-submodules=dirty 2>/dev/null)
    test -n "$changes"
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

    set -l cwd (string replace -r "^$HOME" '~' (pwd))
    set -l user (whoami)
    set -l git_info

    set -l git_branch (_git_branch_name)
    if test -n "$git_branch"
        if contains -- $git_branch master main trunk
            set git_info "$white($red$git_branch"
        else
            set git_info "$white($magenta$git_branch"
        end
        if _is_git_dirty
            set git_info "$git_info$yellow*$white)"
        else
            set git_info "$git_info$white)"
        end
    end

    echo -n $yellow$user":" $cyan$cwd $git_info
    echo
    echo -n $white$__fish_prompt_char
end

