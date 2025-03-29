function whoneeds --description "List system packages depending on provided package"
    if type -q pacman
        comm -12 (pactree -lru $argv[1]|sort|psub) \
            (pacman -Qqe|sort|psub) \
            | grep -v "^$argv[1]\$"
    else if type -q brew
        brew uses --installed $argv
    else
        echo "Not implemented"
    end
end
