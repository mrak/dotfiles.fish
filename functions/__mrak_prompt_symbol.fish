function __mrak_prompt_symbol -a last_status
    #set -l symbol ∫
    #set -l symbol λ
    set -l symbol 👻
    #set -l symbol_nonzero 😈
    set -l symbol_nonzero ☠️

    if test $USER = root
        set_color red
        set symbol '#'
    else
        if test ! $last_status = 0
            set symbol $symbol_nonzero
        end
    end

    set_color normal
    for lvl in (seq 1 $SHLVL)
        printf $symbol
    end
end
