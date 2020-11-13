function fish_prompt
    set -l lstatus $status
    if [ $lstatus -lt 126 ]
        set -g __mrak_prompt_status $lstatus
    else if [ $lstatus -gt 127 ]
        set -g __mrak_prompt_status (kill -l (math $lstatus - 128))
    else if [ $lstatus = 126 ]
        set -g __mrak_prompt_status "X"
    else if [ $lstatus = 127 ]
        set -g __mrak_prompt_status "?"
    else
        set -g __mrak_prompt_status $lstatus
    end

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
