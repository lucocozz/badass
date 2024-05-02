#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 5 ]; then
	echo "Usage: $0 <hostname> <lo_addr> <eth0_cidr> <eth1_cidr> <eth2_cidr>"
	exit 1
fi

readonly HOSTNAME=$1
readonly LO_ADDR=$2
readonly ETH0_CIDR=$3
readonly ETH1_CIDR=$4
readonly ETH2_CIDR=$5

/usr/lib/frr/frrinit.sh start

# Start vtysh shell
vtysh << EOM
conf t

# Set the hostname of the router
hostname ${HOSTNAME}

# Disable IPv6 forwarding
no ipv6 forwarding

# Configure IP addresses for interfaces eth0, eth1, and eth2
interface eth0
ip address ${ETH0_CIDR}

interface eth1
ip address ${ETH1_CIDR}

interface eth2
ip address ${ETH2_CIDR}

# Configure IP address for loopback interface
interface lo
ip address ${LO_ADDR}/32

# Configure BGP with AS number
router bgp 1

# Define a peer group named 'ibgp'
neighbor ibgp peer-group

# Set the remote AS number for the 'ibgp' peer group to 1
neighbor ibgp remote-as 1

# Set the source of BGP updates to the loopback interface
neighbor ibgp update-source lo

# Allow BGP to listen for peers in the 1.1.1.0/29 and assign them to the 'ibgp' peer group
bgp listen range 1.1.1.0/29 peer-group ibgp

# Enable EVPN address family and activate it for the 'ibgp' peer group
address-family l2vpn evpn
neighbor ibgp activate
neighbor ibgp route-reflector-client

# Exit the EVPN address family configuration
exit-address-family

router ospf
network 0.0.0.0/0 area 0
line vty

EOM

# Keep the script running
while true; do
	sleep 1d
done
