function __mrak_prompt_env
    if set -q VIRTUAL_ENV
        printf '%s🐍%s' (set_color green) (basename $VIRTUAL_ENV)
    end
end
