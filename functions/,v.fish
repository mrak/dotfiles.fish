function ,v --description "Open init.vim for editing"
    env -C $XDG_CONFIG_HOME/nvim $EDITOR $XDG_CONFIG_HOME/nvim/init.vim $argv
end

