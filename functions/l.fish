switch (uname)
    case Linux
        function l --description "ls without hidden files"
            ls --ignore=".*" $argv
        end
    case Darwin
        function l --description "ls without hidden files"
            command ls -Fh $argv
        end
    case '*'
        function ls
            command ls $argv
        end
end
