# Part 1

## Theory

### What is a packet routing software ?
A packet routing software is a software that is used to route packets from one network to another. It is used to determine the best path for a packet to reach its destination.

Some examples of open-source packet routing software are _BIRD_, _FRouting_, _Quagga_...

### What is the _Border Gateway Protocol_ ?
The _Border Gateway Protocol (BGP)_ is a standardized exterior gateway protocol designed to exchange routing and reachability information among autonomous systems on the Internet. The protocol is classified as a path vector protocol. The _BGP_ makes routing decisions based on paths, network policies, or rule-sets configured by a network administrator and is involved in making core routing decisions.

Its main advantage is that it is very scalable for large networks.

### What is the _Open Shortest Path First_ protocol ?
_Open Shortest Path First (OSPF)_ is a routing protocol for _Internet Protocol (IP)_ networks. It uses a link state routing algorithm and falls into the group of interior gateway protocols, operating within a single autonomous system.

Its main advantage is that it converges quickly and uses cost as a metric to determine the best path.

The key difference between _OSPF_ and _BGP_ is that _OSPF_ is an interior gateway protocol, while _BGP_ is an exterior gateway protocol. So, _OSPF_ is used to route packets within an autonomous system such as LANs, while _BGP_ is used to route packets between autonomous systems.

### What is _FRRouting_ ?
_FRRouting (FRR)_ is an IP routing protocol suite for Unix and Linux platforms which includes protocol daemons for _BGP_, _IS-IS_, _LDP_, _OSPF_, _PIM_, and _RIP_. _FRR_’s seamless integration with the native Linux/Unix IP networking stacks makes it a natural fit for cloud environments. _FRR_ provides a suite of scalable routing protocols that are well suited for large cloud deployments.

### What is Busybox ?
_BusyBox_ is a software suite that provides several Unix utilities in a single executable file. It runs in a variety of POSIX environments such as Linux, Android, and FreeBSD, although many of the tools it provides are designed to work with interfaces provided by the Linux kernel. As such, it is a very useful tool for embedded systems. It contains commonly used commands, such as `cd`, `ls`, `sh`, `tar`, etc.
