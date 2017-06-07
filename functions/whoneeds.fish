if type -q pacman
    function whoneeds --description "List system packages depending on provided package"
        comm -12 (pactree -lru $argv[1]|sort|psub) \
                (pacman -Qqe|sort|psub) \
                | grep -v $1
    end
else if type -q brew
    function whoneeds --description "List system packages depending on provided package"
        brew uses --installed $argv
    end
end
