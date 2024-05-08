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
hostname ${HOSTNAME}
no ipv6 forwarding

interface eth0
	ip address ${ETH0_CIDR}

interface eth1
	ip address ${ETH1_CIDR}

interface eth2
	ip address ${ETH2_CIDR}

interface lo
	ip address ${LO_ADDR}/32

router bgp 1
	neighbor ibgp peer-group
	neighbor ibgp remote-as 1
	neighbor ibgp update-source lo
	bgp listen range 1.1.1.0/24 peer-group ibgp

address-family l2vpn evpn
	neighbor ibgp activate
	neighbor ibgp route-reflector-client
	exit-address-family

router ospf
	network 0.0.0.0/0 area 0

EOM

# Keep the script running
while true; do
	sleep 1d
done
