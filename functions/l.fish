function l --wraps ls --description "ls without hidden files"
    switch $UNAME
        case Linux
            ls --ignore=".*" $argv
        case Darwin
            command ls -Fh $argv
        case '*'
            command ls $argv
    end
end
