function xrdbmerge --wraps xrdb
    xrdb -quiet -merge $HOME/.Xresources $argv
end

