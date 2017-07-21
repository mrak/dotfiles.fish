function v --description 'Open with $VISUAL'
    if set -q VISUAL
        eval $VISUAL $argv
    end
end
