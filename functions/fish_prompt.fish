function fish_prompt
    set -g __mrak_prompt_status (fish_status_to_signal $status)

    printf '%s %s %s%s\n%s%s ' (__mrak_prompt_user) (__mrak_prompt_pwd) (__mrak_prompt_k8s) (__mrak_prompt_repo_info) (__mrak_prompt_env) (__mrak_prompt_symbol) | tr -s ' '
end
