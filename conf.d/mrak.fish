status is-interactive; or exit

fish_add_path -P -m -g "$HOME/.cargo/bin" "$GOPATH/bin" /opt/homebrew/bin

for asdf_dir in ~/.asdf /opt/asdf-vm
    if [ -f "$asdf_dir"/asdf.fish ]
        source "$asdf_dir"/asdf.fish
        ln -s "$asdf_dir"/completions/asdf.fish ~/.config/fish/completions/ 2>/dev/null
        break
    end
end
for fzf_dir in /opt/homebrew/opt/fzf/ /usr/local/opt/fzf/
    if [ -f "$fzf_dir"/shell/key-bindings.fish ]
        source "$fzf_dir"/shell/key-bindings.fish
        break
    end
end

fish_add_path -P -m -g "$XDG_DATA_BIN"

command -q python; and eval (python -m virtualfish 2>/dev/null)

# if the terminal supports it, set keyboard_transmit mode
# fixes st
if tput smkx 2>/dev/null
    function mrak_disable_keypad_transmit --on-event fish_preexec
        tput rmkx 2>/dev/null
    end

    function mrak_enable_keypad_transmit --on-event fish_postexec
        tput smkx 2>/dev/null
    end
end

#
fish_config theme choose Mrak
# Emulates vim's cursor shape behavior
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_cursor_visual block

complete --command a --wraps aura
