function _edit_cmd --description 'Use $EDITOR to enter command'
    set -l file (mktemp /tmp/fish.cmd.XXXXXXXX.fish)
    if [ -n "$file" ]
        commandline -b > $file
        $EDITOR $file
        commandline -r (cat $file)
        command rm $file
    end
end
