function psg
	if [ (uname) = "Linux" ]
        command ps -eo pid,user,start_time,cmd --sort -etime | grep -Fv "grep" | grep -E $argv
    else
        command ps -eo pid,user,start,command | grep -Fv "grep" | grep -E $argv
    end
end
