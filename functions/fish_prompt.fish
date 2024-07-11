function fish_prompt
    set -l last_status $status

    string join '' --                                    \
        (__mrak_prompt_user)                             \
        ' ' (set_color green) (prompt_pwd)               \
        (__mrak_prompt_k8s)                              \
        (fish_git_prompt | string replace -ra '[()]' '') \

    string join '' -- (__mrak_prompt_env) (__mrak_prompt_symbol $last_status) ' '
end
