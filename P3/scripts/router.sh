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
hostname ${HOSTNAME}
no ipv6 forwarding

interface eth0
	ip address ${IP_CIDR}
	ip ospf area 0

interface lo
	ip address ${LO_ADDR}/32
	ip ospf area 0

router bgp 1
	neighbor 1.1.1.1 remote-as 1
	neighbor 1.1.1.1 update-source lo

address-family l2vpn evpn
	neighbor 1.1.1.1 activate
	advertise-all-vni
	exit-address-family

router ospf
EOM

# Keep the script running
while true; do
	sleep 1d
done