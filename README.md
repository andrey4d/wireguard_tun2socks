### Containers to make wireguard server through the socks5
### wireguard -> tun2socks -> socks5
###

#### Build tun2socks
```shell
docker compose build 
```

#### Start
```shell
docker compose up --force-recreate
```

#### Configure
#### Edit docker-compose.yml
```yaml
tun2socks:
    environment:
        - PROXY=<SOCKS5_PROXY>:1080

wireguard:
    environment:
        - SERVERURL=<HOSTNAME or IP>
        - PEERS=<COUNT>
```
