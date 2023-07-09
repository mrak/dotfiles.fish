switch (uname)
    case Linux
        function l --wraps ls --description "ls without hidden files"
            ls --ignore=".*" $argv
        end
    case Darwin
        function l --wraps ls --description "ls without hidden files"
            command ls -Fh $argv
        end
    case '*'
        function l --wraps ls
            command ls $argv
        end
end
