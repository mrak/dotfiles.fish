switch (uname)
    case Linux
        function upgrade --description 'updates system packages'
            sudo pacman -Syu
        end
    case Darwin
        function upgrade --description 'Update and upgrade all brew packages'
            brew update; and brew upgrade --all
        end
end
