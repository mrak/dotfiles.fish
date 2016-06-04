function java-debug
    java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 $argv
end

