#!/usr/bin/env sh

TUNNEL_GW=${TUNNEL_GW:-"172.20.1.2"}
WIRWGUARD_NET=${WIRWGUARD_NET:-"10.9.1.0/24"}
ROUTE_TABLE=${ROUTE_TABLE:-"120"}


ip route add default via ${TUNNEL_GW} table ${ROUTE_TABLE}
ip rule add from ${WIRWGUARD_NET} table ${ROUTE_TABLE}