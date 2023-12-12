#!/usr/bin/env sh

echo "Load modules for fedora 39"

MODULES="wireguard ip_tables iptable_filter iptable_nat wireguard xt_MASQUERADE"

SUDO="sudo"
for MODULE in ${MODULES}; do
    echo -n "  load ${MODULE} ..."
    "${SUDO}" modprobe "${MODULE}"
    echo " done."
done;
