function sshup --description 'Add all ssh keys to the agent'
    set -q SSH_AUTH_SOCK; or return
    set -l to_load

    set -l keys $HOME/.ssh/login-keys.d/*
    set -l loaded_keys (ssh-add -l | cut -d' ' -f2)

    if [ $status = 1 ]
        ssh-add $keys
        return
    end

    for key in $keys
        set -l fingerprint (ssh-keygen -lf $key | cut -d' ' -f2)
        if not contains $fingerprint $loaded_keys
            set to_load $to_load $key
        end
    end

    if count $to_load
        ssh-add $to_load
    end
end
