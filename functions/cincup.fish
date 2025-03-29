function cincup --description "setup shell for cinc/chef use"
    if not command -q cinc
        echo "Not implemented"
    else
        set -l init_cache $XDG_CACHE_HOME/.chef-shell-init.fish
        find $init_cache -mtime +1d -delete > /dev/null 2>&1
        if test ! -f $init_cache
            cinc shell-init fish > $init_cache
        end
        source $init_cache
    end
end
