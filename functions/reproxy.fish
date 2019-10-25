function reproxy --description "Restart the SOCKS5 autossh tunnel"
    launchctl stop online.eric.mrak.autossh-proxy
    launchctl start online.eric.mrak.autossh-proxy
end
