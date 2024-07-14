function killallssh
    ps -ef | awk '/(ssh: .* \[mux\]| ssh )/ && !/awk/ {print $2}' | xargs kill
end
