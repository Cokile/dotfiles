function fish_user_key_bindings
    fish_vi_key_bindings
    
    # map jj to Esc
    bind -M insert -m default jj backward-char force-repaint
end

