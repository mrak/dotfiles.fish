function mtp-mount --description "mount device over mtp to ~/MTP"
    mkdir $HOME/MTP
    simple-mtpfs $HOME/MTP
end

