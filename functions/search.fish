function search --description "search official and AUR packages"
    pacman -Ss $argv

    if type -q pacaur
        pacaur -s $argv
    else if type -q aura
        aura -As $argv
    end
end
