function psg
	if [ (uname) = "Linux" ]
        command ps -eo pid,user,start_time,cmd --sort -etime | fgrep -v "grep" | grep -E $argv
    else
        command ps -eo pid,user,start,command | fgrep -v "grep" | grep -E $argv
    end
end
