switch (uname)
    case Linux
        function ls --description "ls with bells and whistles"
            command ls -AFC --color=auto $argv
        end
    case Darwin
        function ls --description "ls with bells and whistles"
            command ls -AFh $argv
        end
    case '*'
        function ls
            command ls $argv
        end
end
