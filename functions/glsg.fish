function glsg --wraps grep --description "git ls-files + grep"
    git ls-files | grep $argv
end
