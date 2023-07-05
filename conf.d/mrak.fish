status is-interactive; or exit

fish_add_path -P -m -g "$HOME/.cargo/bin" "$GOPATH/bin" /opt/homebrew/bin
mesg n
set Z_DATA $XDG_DATA_HOME/z/data

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
#set -x EDITOR /usr/bin/vim
#command -q nvim; and set -x EDITOR (command -v nvim)
#set -x VISUAL $EDITOR
#set -x DIFFPROG "$EDITOR -d"

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

set -x GPG_TTY (tty)

#
fish_config theme choose Mrak
# Emulates vim's cursor shape behavior
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace underscore
set fish_cursor_replace_one underscore
set fish_cursor_visual block

set -x JQ_COLORS "0;90:0;37:0;37:0;37:0;32:0;97:0;97"

switch (uname)
    case Linux
        [ -f "$XDG_CONFIG_HOME/sh/dircolors" ]; and command -q dircolors; and eval (dircolors -c "$XDG_CONFIG_HOME/sh/dircolors")
        if [ "$TERM" = linux ]
            printf "]P0262626"
            printf "]P1AC4142"
            printf "]P24E9A06"
            printf "]P3C4A000"
            printf "]P43465A4"
            printf "]P575507B"
            printf "]P606989A"
            printf "]P7D3D7CF"

            printf ']P8555753'
            printf "]P9D24545"
            printf "]PA8AE234"
            printf "]PBFCE94F"
            printf "]PC729FCF"
            printf "]PDAF7FA8"
            printf "]PE34E2E2"
            printf "]PFF5F5F5"

            clear
        end
    case Darwin
        set -x LSCOLORS exbxfxdxcxxxxxCxCxcaea
end
command -q tmux; and [ -z "$TMUX" ]; and exec tmux new -As0
