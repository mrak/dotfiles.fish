mesg n
set Z_DATA $XDG_DATA_HOME/z/data

set fry_rubies $XDG_DATA_LIB/ruby
eval (python -m virtualfish ^/dev/null)

# if the terminal supports it, set keyboard_transmit mode
# fixes st
if tput smkx ^/dev/null
    function mrak_disable_keypad_transmit --on-event fish_preexec
        tput rmkx ^/dev/null
    end

    function mrak_enable_keypad_transmit --on-event fish_postexec
        tput smkx ^/dev/null
    end
end

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
        # ls colors
        [ -f "$XDG_CONFIG_HOME/sh/dircolors" ]; and eval (dircolors -c "$XDG_CONFIG_HOME/sh/dircolors")

        complete --command a --wraps aura

        set -gx _JAVA_AWT_WM_NONREPARENTING 1
        set -gx _JAVA_OPTIONS "$_JAVA_OPTIONS -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Ddefaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
        set -gx _JAVA_OPTIONS "$_JAVA_OPTIONS -Dswing.aatext=true -Ddefaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
        set -gx _JAVA_OPTIONS "$_JAVA_OPTIONS -Ddefaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
        set -gx _JAVA_OPTIONS "$_JAVA_OPTIONS -Duser.home=$XDG_DATA_HOME/java"

        if [ $TERM = linux ]
            echo -en "\033]P0262626"
            echo -en "\033]P1AC4142"
            echo -en "\033]P24E9A06"
            echo -en "\033]P3C4A000"
            echo -en "\033]P43465A4"
            echo -en "\033]P575507B"
            echo -en "\033]P606989A"
            echo -en "\033]P7D3D7CF"

            echo -en "\033]P8555753"
            echo -en "\033]P9D24545"
            echo -en "\033]PA8AE234"
            echo -en "\033]PBFCE94F"
            echo -en "\033]PC729FCF"
            echo -en "\033]PDAF7FA8"
            echo -en "\033]PE34E2E2"
            echo -en "\033]PFF5F5F5"

            clear
            exec tmux
        end
    case Darwin
        set -gx LSCOLORS exbxfxdxcxxxxxCxCxcaea
        set -gx EDITOR /usr/local/bin/nvim
        set -gx VISUAL /usr/local/bin/nvim
        set -gx ANDROID_HOME /usr/local/opt/android-sdk

        #function __start_keychain
            #set -l keychain_dir $XDG_CACHE_HOME/keychain
            #if status --is-interactive
                #keychain --dir $keychain_dir --agents ssh,gpg --quiet --noask
                #source $keychain_dir/(hostname)-fish
                #source $keychain_dir/(hostname)-fish-gpg
            #end
        #end

        #function __start_gpg_agent
            #set -l gpgfile "$GNUPGHOME"/gpg-agent-info

            #if not [ -f $gpgfile ]; or not pgrep gpg-agent -u (id -u) >/dev/null ^&1
            #else
                #echo "here"
                #gpg-agent --daemon --write-env-file $gpgfile --use-standard-socket --pinentry-program /usr/local/bin/pinentry-mac >/dev/null ^&1
            #end

            #set -gx GPG_TTY (tty)
            #for line in  (cat $gpgfile)
                #export $line
            #end
        #end

        #__start_keychain
        #__start_gpg_agent
end
