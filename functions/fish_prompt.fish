function fish_prompt
    set -g __mrak_prompt_status $status

    # reset cursor to block
    switch $TERM
        case 'xterm*'
            printf '\033[2 q'
        case 'rxvt*'
            printf '\033[2 q'
        case '*'
            set -q TERM_PROGRAM; and [ $TERM_PROGRAM = "iTerm.app" ]; and printf '\033[2 q'
    end

    printf '%s %s %s\n%s%s ' (__mrak_prompt_user) (__mrak_prompt_pwd) (__mrak_prompt_repo_info) (__mrak_prompt_env) (__mrak_prompt_symbol) | tr -s ' '
end
