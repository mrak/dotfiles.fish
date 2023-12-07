switch (uname)
    case Linux
        function upgrade --description 'updates system packages'
            paccache -rk2; and paccache -ruk0; and sudo pacman -Syu
        end
    case Darwin
        function upgrade --description 'Update and upgrade all brew packages'
            brew update; and brew upgrade
        end
end
