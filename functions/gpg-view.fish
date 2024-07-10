function gpg-view --description "View private/public keyring"
    gpg --no-default-keyring --secret-keyring /dev/null -a --list-only $argv
end
