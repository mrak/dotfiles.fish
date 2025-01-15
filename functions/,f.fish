function ,f --description "Open config.fish for editing"
    pushd $XDG_CONFIG_HOME/fish
    env $EDITOR config.fish $argv
    popd
end
