function unifi-controller
    if sudo docker container inspect unifi-controller >/dev/null 2>/dev/null
        sudo docker start unifi-controller
    else
        sudo docker run -d \
            --name unifi-controller \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 8443:8443 \
            -p 3478:3478/udp \
            -p 10001:10001/udp \
            -p 8080:8080 \
            -p 1900:1900/udp \
            -p 8843:8843 \
            -p 8880:8880 \
            -p 6789:6789 \
            -p 5514:5514/udp \
            -v $HOME/.local/share/unifi:/config \
            --restart unless-stopped \
            lscr.io/linuxserver/unifi-controller:latest
    end
end