if command -q pacman
    complete -c whoneeds -fr -a '(__fish_print_pacman_packages -i)'
end
