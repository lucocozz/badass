#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <ip_address>"
	exit 1
fi

# Assign argument to a variable
readonly IP_ADDRESS=$1

# Function to check if a command was successful
check_success() {
	if [ $? -ne 0 ]; then
		echo "Error: $1"
		exit 1
	fi
}

# Disable eth0
ip link set eth0 down
check_success "Failed to bring down eth0"

# Set IPv4 address on eth1
ip address add ${IP_ADDRESS}/24 dev eth1
check_success "Failed to assign IP to eth1"

# Keep the script running
while true; do
	sleep 1d
done
