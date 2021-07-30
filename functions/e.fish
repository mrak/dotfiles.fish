function e --description 'Open with $EDITOR'
    if set -q EDITOR
        $EDITOR $argv
    end
end
