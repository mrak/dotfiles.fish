function urlencode
    python2 -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])" $argv
end
