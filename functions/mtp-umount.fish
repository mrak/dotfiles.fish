function mtp-umount --description "unmount MTP device"
    fusermount -u $HOME/MTP
    rmdir $HOME/MTP
end

