#!/usr/bin/env sh

TUNNEL_GW=${TUNNEL_GW:-"tun2socks"}
INTERNAL_SUBNET=${INTERNAL_SUBNET:-"10.9.1.0"}
ROUTE_TABLE=${ROUTE_TABLE:-"120"}

TUNNEL_IP=$(ping -c 1 ${TUNNEL_GW}  | awk 'FNR==2 {print $5}' | awk 'match($0, /(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/) {print substr($0, RSTART, RLENGTH)}')
echo "TUNNEL_IP: ${TUNNEL_IP}"

ip route add default via ${TUNNEL_IP} table ${ROUTE_TABLE}
ip rule add from ${INTERNAL_SUBNET}/24 table ${ROUTE_TABLE}