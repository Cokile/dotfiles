function fish_mode_prompt
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --background "#7C6F64" "#F4E5B7"
                echo '[N]'
            case insert
                set_color --background "#6F8352" "#F4E5B7"
                echo '[I]'
            case replace replace_one
                set_color --background "#A96B2D" "#F4E5B7"
                echo '[R]'
            case visual
                set_color --background "#AF5759" "#F4E5B7"
                echo '[V]'
            case '*'
                set_color --background "#7C6F64" "#F4E5B7"
                echo "[?]"
        end
        set_color normal
        echo -n ' '
    end
end
