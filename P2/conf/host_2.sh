# Disable eth0
ip link set eth0 down

# Set IPv4 address on eth1
ip address add 30.1.1.2/24 dev eth1

ifconfig eth1
