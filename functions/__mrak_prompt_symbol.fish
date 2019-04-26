function __mrak_prompt_symbol
    #set -l symbol ∫
    set -l symbol "⋊>"

    if [ $USER = "root" ]
        set_color red
        set symbol #
    else
        if [ $__mrak_prompt_status = 0 ]
            set_color green
        else
            set_color red
        end
    end

    if set -q __mrak_prompt_symbol
        set symbol $__mrak_prompt_symbol[1]
        set_color $__mrak_prompt_symbol[2]
        set -e __mrak_prompt_symbol
    end

    for lvl in (seq 1 $SHLVL)
        printf $symbol
    end

    set -l job_count (count (jobs))
    if [ ! $job_count = 0 ]
        set_color brblack
        printf ' (%s)' $job_count
    end

    set_color normal
end
