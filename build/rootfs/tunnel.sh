#!/bin/sh

#variables


DEF_GATE=$(ip r | grep 'default' | awk '{print$3}') # This will output your default gateway ip address . if command fails try finding the deault gateway ip by using 'ip r' command
echo $DEF_GATE


ip tuntap add mode tun dev tun0
ip addr add 198.18.0.1/15 dev tun0
ip link set dev tun0 up

ip route del default
ip route add default via 198.18.0.1 dev tun0 metric 1
ip route add default via $DEF_GATE dev eth0 metric 10

tun2socks -device tun0 -proxy socks5://127.0.0.1:1080 -interface eth0

#ip tuntap add dev tun0 mode tun
#ip addr add 10.0.0.1/24 dev tun0
# ip addr add fdfe:dcba:9876::1/125 dev tun0

#ip route add $XRAY_IP via $DEF_GATE
#ip link set tun0 up
# ip -6 link set tun0 up
# ip route add default dev tun0
# ip -6 route add default dev tun0
# chmod +x tun2socks

# xray -c  ${CONFIG} > /dev/null &
# sleep 5
# tun2socks -device tun://tun0 -proxy socks5://127.0.0.1:1080 # you can define the local socks5 port here 10808 is the default
# ip tuntap del dev tun0 mode tun
# ip route del $xray_ip via $DEF_GATE
