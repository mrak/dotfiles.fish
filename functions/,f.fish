function ,f --description "Open config.fish for editing"
    env $EDITOR $XDG_CONFIG_HOME/fish/conf.d/mrak.fish $argv
end
