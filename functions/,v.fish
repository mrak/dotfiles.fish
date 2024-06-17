function ,v --description "Open init.vim for editing"
    env -C $XDG_CONFIG_HOME/nvim $EDITOR init.vim $argv
end

