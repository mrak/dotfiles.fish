complete --command p --wraps pacman

function p --description "pacman, or AUR helper"
    if command -qs trizen
        command trizen $argv
    else
        command pacman $argv
    end
end
