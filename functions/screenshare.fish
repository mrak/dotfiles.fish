function screenshare
    x11vnc -forever -display :0 -rbfauth $XDG_CONFIG_HOME/x11vnc/passwd
end
