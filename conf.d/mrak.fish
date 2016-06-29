mesg n
set fry_rubies $XDG_DATA_LIB/ruby
set Z_DATA $XDG_DATA_HOME/z/data

complete --command g --wraps git

eval (python -m virtualfish ^/dev/null)

# if the terminal supports it, set keyboard_transmit mode
# fixes st
if tput smkx ^/dev/null
    function mrak_enable_keypad_transmit --on-event fish_postexec
        tput smkx ^/dev/null
    end

    function mrak_disable_keypad_transmit --on-event fish_preexec
        tput rmkx ^/dev/null
    end
end
