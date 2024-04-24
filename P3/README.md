# Part 2

## Theory

### What is _BGP_ and _EVPN_ ?
BGP (Border Gateway Protocol) is a standardized exterior gateway protocol that is used to exchange routing information between different autonomous systems on the Internet. EVPN (Ethernet Virtual Private Network) is a network technology that allows for the extension of a Layer 2 network over an IP network.

### What is the principle of route reflection?
Route reflection is a technique used in BGP to increase the scalability of the network. A route reflector is a router that forwards BGP updates to other routers within the same autonomous system.

### What does VTEP mean?
VTEP stands for VXLAN Tunnel Endpoint. It is the entity which originates and terminates a VXLAN tunnel. It can encapsulate incoming Ethernet frames into VXLAN packets and send them through the IP network.

### What does VNI mean?
VNI stands for VXLAN Network Identifier. It is a 24-bit field in the VXLAN header that is used to identify individual Layer 2 segments within the VXLAN.

### What is the difference between type 2 and type 3 routes?
Type 2 and Type 3 are different types of routes in EVPN. Type 2 routes are used for MAC/IP advertisement, while Type 3 routes are used for Inclusive Multicast Ethernet Tag routes.
