function __mrak_prompt_env
    if set -q VIRTUAL_ENV
        set_color green
        printf '(🐍  %s) ' (basename $VIRTUAL_ENV)
        set_color normal
    end
end
