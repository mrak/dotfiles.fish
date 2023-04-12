function killallssh
    ps -ef | grep -Fv awk | awk '/(ssh: .* \[mux\]| ssh )/ {print $2}' | xargs kill
end
