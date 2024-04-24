#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <local_ip> <vxlan_ip>"
	exit 1
fi

# Assign arguments to variables
readonly LOCAL_IP=$1
readonly VXLAN_IP=$2

# Setup the bridge
ip link add name br0 type bridge
ip link set br0 up

# Set IPv4 address on eth0
ip addr add ${LOCAL_IP}/24 dev eth0

# Setup VXLAN
ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789
ip addr add ${VXLAN_IP}/24 dev vxlan10

# Link eth1 and vxlan10 to the bridge
ip link set eth1 master br0
ip link set vxlan10 master br0

# Enable the interface
ip link set vxlan10 up

# Keep the script running
while true; do
	sleep 1d
done
