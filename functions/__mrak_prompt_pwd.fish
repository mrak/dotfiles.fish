function __mrak_prompt_pwd
    set_color green
    string replace $HOME '~' $PWD | string replace -ra '([^/.])[^/]*/' '$1/' | tr -d '\n'
    set_color normal
end
