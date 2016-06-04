function l --description "ls without hidden files"
    ls --ignore=".*" $argv
end

