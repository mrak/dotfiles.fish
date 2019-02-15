function fish_title --description "Sets the terminal title"
    set -l LOCATION (tty | string replace '/dev/' '')
    if set -q SSH_CLIENT
        set LOCATION $hostname
    end
    set -l DIR (string replace $HOME '~' $PWD)
    echo $LOCATION $DIR
end
