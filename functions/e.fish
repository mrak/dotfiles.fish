function e --description 'Open with $EDITOR'
    if set -q EDITOR
        eval $EDITOR $argv
    end
end
