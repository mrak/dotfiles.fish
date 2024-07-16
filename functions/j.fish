function j --description "jump around"
    if count $argv > /dev/null
        __z $argv
    else
        cd (__z -l | fzf --with-nth 2 --height 40% --reverse --bind 'enter:become(echo {2})')
    end
end
