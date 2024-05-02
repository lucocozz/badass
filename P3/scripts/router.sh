#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
	echo "Usage: $0 <hostname> <lo_addr> <ip_cidr>"
	exit 1
fi

readonly HOSTNAME=$1
readonly LO_ADDR=$2
readonly IP_CIDR=$3


/usr/lib/frr/frrinit.sh start

ip link add br0 type bridge
ip link set dev br0 up
ip link add vxlan10 type vxlan id 10 dstport 4789
ip link set dev vxlan10 up

brctl addif br0 vxlan10
brctl addif br0 eth1


vtysh << EOM
conf t
# Set the hostname of the router
hostname ${HOSTNAME}

# Disable IPv6 forwarding
no ipv6 forwarding

# Configure IP address for interface eth0 and set its OSPF area to 0
interface eth0
ip address ${IP_CIDR}
ip ospf area 0

# Configure IP address for loopback interface and set its OSPF area to 0
interface lo
ip address ${LO_ADDR}/32
ip ospf area 0

# Configure BGP with AS number 1 and set neighbor details
router bgp 1
neighbor 1.1.1.1 remote-as 1
neighbor 1.1.1.1 update-source lo

# Enable EVPN address family and activate it for the neighbor 1.1.1.1
address-family l2vpn evpn
neighbor 1.1.1.1 activate

# Advertise all VNI
advertise-all-vni

# Exit the EVPN address family configuration
exit-address-family

# Configure OSPF
router ospf
EOM

# Keep the script running
while true; do
	sleep 1d
done