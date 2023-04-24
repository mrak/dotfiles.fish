function orphans --description "find packages that are uneeded"
    if [ (uname) = "Darwin" ]
        brew autoremove
    else
        sudo pacman -Rs (pacman -Qqdt) $argv
    end
end

