mesg n
set fry_rubies $XDG_DATA_LIB/ruby
set Z_DATA $XDG_DATA_HOME/z/data

complete --command g --wraps git

eval (python -m virtualfish ^/dev/null)
