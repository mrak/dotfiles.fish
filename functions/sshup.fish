function sshup --description 'Add all ssh keys to the agent'
    set -q SSH_AUTH_SOCK; or return
    set -l to_load

    set -l keys (find ~/.ssh/keys.d -name "id_*" -type f -not -name "*.pub" -not -path "*.git/*")
    set -l loaded_keys (ssh-add -l | string split ' ' -f 2)

    if test $status = 1
        ssh-add $keys
        return
    end

    for key in $keys
        set -l fingerprint (ssh-keygen -lf $key | string split ' ' -f 2)
        if not contains $fingerprint $loaded_keys
            set to_load $to_load $key
        end
    end

    if test (count $to_load) -gt 0
        ssh-add $to_load
    end
end
