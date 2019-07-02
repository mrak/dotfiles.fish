function _sudo_edit
    [ -z (commandline) ]; and commandline $history[1];
    set cursor_pos (math (commandline -C) + 5)
    commandline -C 0
    commandline -i 'sudo '
    commandline -C $cursor_pos
end
