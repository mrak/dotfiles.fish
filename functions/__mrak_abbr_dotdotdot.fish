function __mrak_abbr_dotdotdot
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
