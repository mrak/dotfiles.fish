function npm-exec --description "run executable installed locally by npm"
    begin
        set -lx PATH (npm bin) $PATH
        eval $argv
    end
end

