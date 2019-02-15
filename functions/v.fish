function v --description 'Open with $VISUAL'
    if set -q VISUAL
        $VISUAL $argv
    end
end
