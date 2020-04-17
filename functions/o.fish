switch (uname)
    case Linux
        function o --description 'open file with preferred program'
            xdg-open $argv
        end
    case Darwin
        function o --description 'open file with preferred program'
            command open $argv
        end
end

