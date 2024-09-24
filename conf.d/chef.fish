status is-interactive; or exit
command -q cinc; or exit

begin
    set -l init_cache $XDG_CACHE_HOME/.chef-shell-init.fish
    find $init_cache -mtime +1d -delete > /dev/null 2>&1
    if [ ! -f $init_cache ]
        cinc shell-init fish > $init_cache
    end
    source $init_cache
end
