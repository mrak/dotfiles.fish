function __mrak_prompt_user
    if [ $USER = "root" ]
        set_color red
    else
        set_color blue
    end

    printf $USER

    if set -q SSH_CONNECTION
        set_color --bold black
        printf @
        set_color normal
        set_color magenta
        printf '%s' (hostname)
    end

    set_color normal
end
