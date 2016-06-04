function fish_title --description "Sets the terminal title"
    set -l TTY (tty | string replace '/dev/' '')
    set -l DIR (string replace $HOME '~' $PWD)
    echo $TTY $DIR
end
