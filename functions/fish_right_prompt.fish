function fish_right_prompt
    set -l last_status $status
    set_color $fish_color_status
    # if test $last_status != 0
    #     printf '(%s) ' (fish_status_to_signal $last_status)
    # end
    date +%T
    set_color normal
end
