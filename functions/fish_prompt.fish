function fish_prompt
    set -l last_status $status
    set -l color_cwd $fish_color_cwd

    if fish_is_root_user
        set $fish_color_cwd_root
    end

    string join '' --                                    \
        (__mrak_prompt_user)                             \
        ' ' (set_color $color_cwd) (prompt_pwd)          \
        (__mrak_prompt_k8s)                              \
        (fish_git_prompt | string replace -ra '[()]' '') \

    string join '' -- (__mrak_prompt_env) (__mrak_prompt_symbol $last_status) ' '
end
