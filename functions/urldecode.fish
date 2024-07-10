function urldecode
    python2 -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])" $argv
end
