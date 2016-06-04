function killallssh
    ps -ef | fgrep -v awk | awk '/(ssh: .* \[mux\]| ssh )/ {print $2}' | xargs kill
end
