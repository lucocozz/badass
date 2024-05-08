#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <ip_cidr>"
    exit 1
fi

readonly IP_CIDR=$1


ip address add ${IP_CIDR} dev eth0

# Keep the script running
while true; do
	sleep 1d
done