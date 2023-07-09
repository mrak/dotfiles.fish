if [ (uname) = "Darwin" ]
    function orphans --description "find packages that are uneeded"
        brew autoremove
    end
else
    function orphans --wraps pacman --description "find packages that are uneeded"
        sudo pacman -Rs (pacman -Qqdt) $argv
    end
end
