function npm-exec --description "run executable installed locally by npm"
    begin
        set -lxp PATH (npm bin)
        eval $argv
    end
end

