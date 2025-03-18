if command -q pacman
    complete -c whoneeds -fr -a '(__fish_print_pacman_packages -i)'
else if command -q brew
    complete -c whoneeds -fr -a '(brew list)'
end
