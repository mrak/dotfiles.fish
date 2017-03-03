complete --command p --wraps pacaur

function p --description pacaur
    if command -qs pacaur
        command pacaur $argv
    else
        command pacman $argv
    end
end
