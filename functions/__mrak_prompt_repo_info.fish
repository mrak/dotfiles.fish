function __mrak_prompt_repo_info --description "prompt info for git"
    fish_git_prompt | string replace -ra '^ |[()]' ''
end
