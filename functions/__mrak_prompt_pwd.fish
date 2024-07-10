function __mrak_prompt_pwd
    if [ $USER = root ]
        set_color $fish_color_cwd_root
    else
        set_color $fish_color_cwd
    end
    string replace $HOME '~' $PWD | string replace -ra '([^/.])[^/]*/' '$1/' | tr -d '\n'
    set_color normal
end
