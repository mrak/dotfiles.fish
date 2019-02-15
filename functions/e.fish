function e --description 'Open with $EDITOR'
    if set -q EDITOR
        $EDITOR (string escape -- $argv)
    end
end
