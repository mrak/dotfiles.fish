function __mrak_prompt_user
    if fish_is_root_user
        set_color red
    else
        set_color $fish_color_user
    end

    printf $USER

    if set -q SSH_CONNECTION
        set_color brblack
        printf @
        set_color normal
        set_color $fish_color_host
        printf '%s' $hostname
    end

    set_color normal
end
