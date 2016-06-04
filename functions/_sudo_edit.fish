function _sudo_edit
    [ -z (commandline) ]; and commandline $history[1];
    set cursor_pos (echo (commandline -C) + 5 | bc)
    commandline -C 0
    commandline -i 'sudo '
    commandline -C $cursor_pos
end
