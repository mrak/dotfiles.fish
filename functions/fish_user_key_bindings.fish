function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert

    type -q fzf_key_bindings; and fzf_key_bindings
    bind \e. history-token-search-backward

    bind -k ppage history-search-backward
    switch $TERM
        case dvtm-256color
            bind \cH backward-kill-path-component
        case screen-256color st-256color
            bind \cH backward-kill-path-component
            bind \e\[M kill-word
        case rxvt-unicode-256color
            bind \cH backward-kill-path-component
            bind \e\[3^ kill-word
        case xterm-256color
    end
end
