function __mrak_prompt_symbol
    #set -l symbol ∫
    set -l symbol λ

    if [ $USER = root ]
        set_color red
        set symbol '#'
    else
        if [ $__mrak_prompt_status = 0 ]
            set_color --dim
        else
            set_color red
        end
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
