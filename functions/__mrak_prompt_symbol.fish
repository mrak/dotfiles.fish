function __mrak_prompt_symbol -a last_status
    #set -l symbol ∫
    #set -l symbol λ
    set -l symbol 👻

    if [ $USER = root ]
        set_color red
        set symbol '#'
    else
        if [ $last_status = 0 ]
            set_color --dim white
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
