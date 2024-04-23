#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
	echo "Usage: $0 <local_ip> <remote_ip> <vxlan_ip>"
	exit 1
fi

# Assign arguments to variables
readonly LOCAL_IP=$1
readonly REMOTE_IP=$2
readonly VXLAN_IP=$3

# Function to check if a command was successful
check_success() {
	if [ $? -ne 0 ]; then
		echo "Error: $1"
		exit 1
	fi
}

# Setup router connection to switch
ip link add name br0 type bridge
check_success "Failed to create bridge br0"

ip link set br0 up
check_success "Failed to bring up br0"

ip addr add ${LOCAL_IP}/24 dev eth0
check_success "Failed to assign IP to eth0"

# Setup VXLAN
ip link add name vxlan10 type vxlan id 10 dev eth0 dstport 4789 local ${LOCAL_IP} remote ${REMOTE_IP}
check_success "Failed to create VXLAN interface vxlan10"

ip addr add ${VXLAN_IP}/24 dev vxlan10
check_success "Failed to assign IP to vxlan10"

# Add eth1 and vxlan10 to the bridge
ip link set eth1 master br0
check_success "Failed to add eth1 to bridge br0"

ip link set vxlan10 master br0
check_success "Failed to add vxlan10 to bridge br0"

ip link set vxlan10 up
check_success "Failed to bring up vxlan10"

# Show details of vxlan10 and the bridge
ip -d link show vxlan10
bridge link show dev br0

# Keep the script running
while true; do
	sleep 1d
done
