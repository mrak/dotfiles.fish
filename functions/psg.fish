if [ (uname) = "Linux" ]
    function psg --wraps grep
        command ps -eo pid,user,start_time,cmd --sort -etime | grep -Fv "grep" | grep -E $argv
    end
else
    function psg --wraps grep
        command ps -eo pid,user,start,command | grep -Fv "grep" | grep -E $argv
    end
end
