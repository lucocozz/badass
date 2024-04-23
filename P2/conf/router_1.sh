# Setup router 1 connection to switch
ip link add name br0 type bridge
ip link set br0 up
ip addr add 10.1.1.1/24 dev eth0

ip link add name vxlan10 type vxlan id 10 dev eth0 dstport 4789 local 10.1.1.1 remote 10.1.1.2
ip addr add 20.1.1.1/24 dev vxlan10

# Add eth1 and vxlan10 to the bridge
ip link set eth1 master br0
ip link set vxlan10 master br0

ip link set vxlan10 up

# Show details of vxlan10 and the bridge
ip -d link show vxlan10
bridge link show dev br0
