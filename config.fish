status is-interactive; or exit

set -g fish_greeting

for fzf_dir in /opt/homebrew/opt/fzf/ /usr/local/opt/fzf/
    if [ -f $fzf_dir/shell/key-bindings.fish ]
        source $fzf_dir/shell/key-bindings.fish
        break
    end
end

command -q mise; and mise activate fish | source

fish_config theme choose Mrak

# Emulates vim's cursor shape behavior
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_cursor_visual block
