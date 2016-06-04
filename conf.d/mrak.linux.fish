if [ (uname) = "Linux" ]
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
end
