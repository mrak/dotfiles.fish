function orphans --description "find packages that are uneeded"
    sudo pacman -Rs (pacman -Qqdt) $argv
end

