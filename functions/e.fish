function e --description 'Open with $EDITOR'
    if set -q EDITOR
        eval $EDITOR (string escape -- $argv)
    end
end
