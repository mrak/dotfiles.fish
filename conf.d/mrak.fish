if status is-login
    # System #####################################################################
    set -q TMPDIR; or set -x TMPDIR /tmp
    [ "$(uname)" = Darwin ]; and set -x XDG_RUNTIME_DIR "$TMPDIR"
    set -q XDG_DATA_HOME;   or set -x XDG_DATA_HOME "$HOME/.local/share"
    set -q XDG_CACHE_HOME;  or set -x XDG_CACHE_HOME "$HOME/.cache"
    set -q XDG_CONFIG_HOME; or set -x XDG_CONFIG_HOME "$HOME/.config"
    set -q XDG_RUNTIME_DIR; or set -x XDG_RUNTIME_DIR "/run/user/$(id -u)"
    set -x XDG_DATA_ROOT (string replace -r '/[^/]+/?$' '' "$XDG_DATA_HOME")
    set -x XDG_DATA_BIN "$XDG_DATA_ROOT/bin"
    set -x XDG_DATA_LIB "$XDG_DATA_ROOT/lib"
    set -x BROWSER /usr/bin/firefox
    # User Directories ###########################################################
    set -x DEV_HOME "$HOME/Developer"
    set -x GOPATH "$DEV_HOME/Go"
    # Others #####################################################################
    set -q SSH_AUTH_SOCK; or set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh"
    set -x ASPCACHE "$XDG_CACHE_HOME/asp"
    set -x ASPROOT "$XDG_DATA_HOME/asp"
    set -x ATOM_HOME "$XDG_DATA_HOME/atom"
    set -x BERKSHELF_PATH "$XDG_DATA_HOME/berkshelf"
    set -x CLICOLOR 1
    set -x DMENU_OPTIONS "-i -fn monospace-10 -nb grey15 -nf grey82 -sb seagreen -sf black"
    set -x DVDCSS_CACHE "$XDG_DATA_HOME/dvdcss"
    set -x ENV "$XDG_CONFIG_HOME/sh/env"
    set -x FZF_DEFAULT_COMMAND "rg --files --hidden --no-ignore-vcs"
    set -x GIMP2_DIRECTORY "$XDG_DATA_HOME/gimp"
    set -x GOMAXPROCS (nproc 2>/dev/null; or sysctl -n hw.ncpu 2>/dev/null; or echo 2)
    set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"
    set -x GRADLE_USER_HOME "$XDG_CACHE_HOME/gradle"
    set -x GREP_COLORS "ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=01;30:bn=32:se=36"
    set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
    set -x GTK_IM_MODULE "ibus"
    #set -x GTK_IM_MODULE_FILE "/usr/lib/gtk-3.0/3.0.0/immodules.cache"
    set -x GTK_RC_FILES "$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
    set -x HISTFILE "$XDG_DATA_HOME/sh/history"
    set -x HISTFILESIZE 1000 # bash
    set -x HISTSIZE 1000
    set -x HOMEBREW_GITHUB_API_TOKEN 10c1ad8aa55b1b0c9569d7645dd8b4ffd38e090b
    set -x LESS_TERMCAP_mb "[101m"
    set -x LESS_TERMCAP_md "[94m"
    set -x LESS_TERMCAP_us "[4m[32m"
    set -x LESS_TERMCAP_ue "[24[0m"
    set -x LESSHISTFILE /dev/null
    set -x LESSSECURE 1
    set -x LPASS_HOME "$XDG_DATA_HOME/lpass"
    set -x LPASS_AGENT_TIMEOUT 0
    set -x MANWIDTH 80
    set -x MOZ_ENABLE_WAYLAND 1
    set -x NVM_DIR "$XDG_DATA_HOME/nvm"
    set -x N_PREFIX "$XDG_DATA_ROOT"
    set -x PULSE_COOKIE "$XDG_DATA_HOME/pulse/cookie"
    set -x QT_IM_MODULE "ibus"
    set -x RCRC "$XDG_CONFIG_HOME/rcm/rcrc"
    set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
    set -x SAVEHIST 1000 # zsh
    set -x STACK_ROOT "$XDG_DATA_HOME/stack"
    set -x SYNC "$HOME/Sync"
    set -x TASKDATA "$XDG_DATA_HOME/task"
    set -x TASKRC "$XDG_CONFIG_HOME/task/taskrc"
    set -x TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
    set -x TMUX_PLUGIN_MANAGER_PATH "$XDG_DATA_HOME/tmux/plugins"
    set -x TMUX_TMPDIR "$XDG_RUNTIME_DIR/tmux"
    set -x VAGRANT_HOME "$XDG_DATA_HOME/vagrant"
    set -x VIRTUALFISH_HOME "$XDG_DATA_HOME/virtualfish"
    set -x VPAIR_SSH_LOGIN_CMD "autossh -M 0"
    set -x WEECHAT_HOME "$XDG_CONFIG_HOME/weechat"
    set -x WINEPREFIX "$XDG_DATA_HOME/wine"
    set -x WLC_BG 0
    set -x WLC_REPEAT_DELAY 200
    set -x WLC_REPEAT_RATE 50
    set -x XKB_DEFAULT_OPTIONS caps:ctrl_modifier,compose:ralt
    set -x XMODIFIERS "@im=ibus"
    set -x XMONAD_CACHE_DIR "$XDG_CACHE_HOME/xmonad"
    set -x XMONAD_CONFIG_DIR "$XDG_CONFIG_HOME/xmonad"
    set -x XMONAD_DATA_DIR "$XDG_DATA_HOME/xmonad"
    set -x ZDOTDIR "$XDG_CONFIG_HOME/zsh"
    set -x npm_config_userconfig "$XDG_CONFIG_HOME/npm/npmrc"
    # PATH dependent #############################################################
    fish_add_path -P -m -g "$XDG_DATA_BIN" "$HOME/.cargo/bin" "$GOPATH/bin" /opt/homebrew/bin
    set -x EDITOR /usr/bin/vim
    command -q nvim; and set -x EDITOR (command -v nvim)
    set -x VISUAL $EDITOR
    set -x DIFFPROG "$EDITOR -d"
    # Unexport ###################################################################
    set -e LESS LESSCLOSE LESSOPEN SHLVL
    # Execute ####################################################################
    mkdir -p "$XDG_DATA_BIN" "$XDG_DATA_LIB" "$TMUX_TMPDIR"
    switch (hostname)
        case tantarian
            set -x LIBVA_DRIVER_NAME iHD
    end
end

status is-interactive; or exit

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
