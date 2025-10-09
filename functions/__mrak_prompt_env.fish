function __mrak_prompt_env
    # terraform multi-workspace
    if test -f .terraform/environment
        set -l workspace (cat .terraform/environment)
        if string match -qr 'plat|prd' $workspace
            set_color red
        else
            set_color magenta
        end
        echo \ue8bd $workspace
    end

    # python virtualenv
    if set -q VIRTUAL_ENV
        printf '%s🐍%s' (set_color green) (path basename $VIRTUAL_ENV)
    end
end
