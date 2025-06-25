function __mrak_prompt_env
    if set -q VIRTUAL_ENV
        printf '%s🐍%s' (set_color green) (path basename $VIRTUAL_ENV)
    end
end
