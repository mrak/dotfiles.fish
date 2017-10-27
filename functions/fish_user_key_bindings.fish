function fish_user_key_bindings
    type -q fzf_key_bindings; and fzf_key_bindings
    bind \es '_sudo_edit'
    bind \e. 'history-token-search-backward'
    bind \ee '_edit_cmd; commandline -f execute'
    bind \cX\cE '_edit_cmd; commandline -f execute'

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
