switch (uname)
    case Linux
        function o --wraps xdg-open --description 'open file with preferred program'
            xdg-open $argv
        end
    case Darwin
        function o --wraps open --description 'open file with preferred program'
            command open $argv
        end
end

