function __mrak_prompt_tf --description "prompt info for multi-workspace terraform directories"
    test -f .terraform/environment; or return

    set -l workspace (cat .terraform/environment)
    if string match -qr 'plat|prd' $workspace
        set_color red
    else
        set_color magenta
    end
    echo $workspace
end
