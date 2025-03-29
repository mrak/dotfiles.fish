function ls --description "ls with bells and whistles"
    switch $UNAME
        case Linux
            command ls -AFC --color=auto $argv
        case Darwin
            command ls -AFh $argv
        case '*'
            command ls $argv
    end
end
