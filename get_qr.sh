#!/usr/bin/env sh

if [[ "${1}" == "" ]]; then
    echo "Usage: ${0} <PEER>"
    exit
fi

docker exec -it wireguard /app/show-peer "${1}"

