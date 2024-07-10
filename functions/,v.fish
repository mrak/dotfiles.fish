function ,v --description "Open init.vim for editing"
    pushd $XDG_CONFIG_HOME/nvim
    env $EDITOR init.vim $argv
    popd
end
