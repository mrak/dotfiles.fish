function e --description 'Open with $EDITOR'
    if set -q $EDITOR
        eval $EDITOR $argv
    else
        vim $argv
    end
end

