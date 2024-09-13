for plugin in (find $__fish_config_dir/plugins -type d -not -path plugins -depth 1)
    if [ -d $plugin/completions ]; and not contains $plugin/completions $fish_complete_path
        set fish_complete_path $plugin/completions $fish_complete_path
    end
    if [ -d $plugin/functions ]; and not contains $plugin/functions $fish_function_path
        set fish_function_path $plugin/functions $fish_complete_path
    end
    for conf in $plugin/conf.d/*.fish
        source $conf
    end
end
