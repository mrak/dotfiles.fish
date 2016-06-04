function fish_right_prompt
    if [ ! $__mrak_prompt_status = 0 ]
        set_color --bold black;
        printf '%s' $__mrak_prompt_status
        set_color normal
    end

    set -e __mrak_prompt_status
end
