status is-interactive; or exit

fish_add_path -P -m -g "$XDG_DATA_BIN" "$HOME/.cargo/bin" "$GOPATH/bin" /opt/homebrew/bin
set -x EDITOR /usr/bin/vim
command -q nvim; and set -x EDITOR (command -v nvim)
set -x VISUAL $EDITOR
set -x DIFFPROG "$EDITOR -d"

mesg n
set Z_DATA $XDG_DATA_HOME/z/data

command -q python; and eval (python -m virtualfish 2>/dev/null)

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

# colorscheme
set fish_color_user blue
set fish_color_host magenta
set fish_color_cwd green
set fish_color_autosuggestion 555
set fish_color_command 005fd7
set fish_color_comment 555
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end 009900
set fish_color_error ff4444
set fish_color_escape --bold
set fish_color_history_current --bold
set fish_color_match green
set fish_color_normal normal
set fish_color_operator green
set fish_color_param 00afff
set fish_color_quote FFAA00
set fish_color_redirection af87ff
set fish_color_search_match bryellow --background=brblack
set fish_color_selection white --bold --background=brblack
set fish_color_valid_path --underline

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
            exec tmux
        end
    case Darwin
        set -x LSCOLORS exbxfxdxcxxxxxCxCxcaea
        [ "$TERM" = alacritty ]; and exec tmux
end
