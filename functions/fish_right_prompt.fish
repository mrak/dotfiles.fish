function fish_right_prompt
    set -l last_status $status
    [ $last_status = 0 ]; and return
    set_color $fish_color_status
    fish_status_to_signal $last_status
    set_color normal
end
