if [ (uname) = "Darwin" ]
    set -gx LSCOLORS exbxfxdxcxxxxxCxCxcaea
    set -gx EDITOR /usr/local/bin/nvim
    set -gx VISUAL /usr/local/bin/nvim
    set -gx ANDROID_HOME /usr/local/opt/android-sdk

    function __start_keychain
        set -l keychain_dir $XDG_CACHE_HOME/keychain
        if status --is-interactive
            keychain --dir $keychain_dir --agents ssh,gpg --quiet --noask
            source $keychain_dir/(hostname)-fish
            source $keychain_dir/(hostname)-fish-gpg
        end
    end

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

    __start_keychain
#__start_gpg_agent
end
