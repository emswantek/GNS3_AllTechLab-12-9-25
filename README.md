# GNS3_AllTechLab
Purpose: This lab will explore several technologies. 

Device list:
Cisco IOSvL2 | vios_l2-adventerprisek9-m.SSA.high_iron_20180619.qcow2
VPCS (Virtual PC Simulartor)
Cisco 7200 | c7200-advipservicesk9-mz.152-4.S5.image
Cisco NXOS | nxosv.9.3.1.qcow2

All Layer 2 switches are Cisco IOSvL2
All routers are c7200 with varying line cards
The 2 VPC paired switches are NXOS

Left section LAN1 or Customer-A
3 PCs on separate VLANs
PC1 - VLAN##
PC2 - VLAN##
PC3 - VLAN##
4 layer 2 switches
2 routers running OSPF
CE1 connected to ISP-PE1 via BGP

Center section ISP, MPLS provider
ISP routers running MPLS over IS-IS
2 VRFs separating the two LANs

Right Section - LAN2 or Customer-B
CE2 connected to ISP via BGP
CE2, EIGRP-R2, EIGRP-R3 connected via EIGRP 65535
DC-SW1 - Layer 2 switch

Config summaries
SW1#sh cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
SW2              Gig 0/2           164             R S I            Gig 0/1
SW3              Gig 0/3           153             R S I            Gig 0/1

SW1#sh int status

Port      Name               Status       Vlan       Duplex  Speed Type
Gi0/0                        notconnect   1          a-full   auto RJ45
Gi0/1                        notconnect   1          a-full   auto RJ45
Gi0/2     To_SW2             connected    trunk      a-full   auto RJ45
Gi0/3     To_SW3             connected    trunk      a-full   auto RJ45
Gi1/0                        notconnect   1          a-full   auto RJ45
Gi1/1     To_VPCS-PC-1       connected    11         a-full   auto RJ45
Gi1/2                        notconnect   1          a-full   auto RJ45
Gi1/3                        notconnect   1          a-full   auto RJ45
Gi2/0                        notconnect   1          a-full   auto RJ45
Gi2/1     To_VPCS-PC-2       connected    22         a-full   auto RJ45
Gi2/2                        notconnect   1          a-full   auto RJ45
Gi2/3                        notconnect   1          a-full   auto RJ45
Gi3/0                        notconnect   1          a-full   auto RJ45
Gi3/1     To_VPCS-PC-3       connected    33         a-full   auto RJ45
Gi3/2                        notconnect   1          a-full   auto RJ45
Gi3/3                        notconnect   1          a-full   auto RJ45

SW1#sh spanning-tree summary
Switch is in pvst mode
Root bridge for: none
Extended system ID                      is enabled
Portfast Default                        is disabled
Portfast Edge BPDU Guard Default        is disabled
Portfast Edge BPDU Filter Default       is disabled
Loopguard Default                       is disabled
PVST Simulation Default                 is enabled but inactive in pvst mode
Bridge Assurance                        is enabled but inactive in pvst mode
EtherChannel misconfig guard            is enabled
Configured Pathcost method used is short
UplinkFast                              is disabled
BackboneFast                            is disabled

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
VLAN0001                     1         0        0         12         13
VLAN0010                     1         0        0          1          2
VLAN0011                     1         0        0          2          3
VLAN0022                     1         0        0          2          3
VLAN0033                     1         0        0          2          3
---------------------- -------- --------- -------- ---------- ----------

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
5 vlans                      5         0        0         19         24


SW2#show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
SW4              Gig 0/0           160             R S I            Gig 0/2
SW1              Gig 0/1           134             R S I            Gig 0/2

SW2#sh int status

Port      Name               Status       Vlan       Duplex  Speed Type
Gi0/0     To_SW4             connected    trunk      a-full   auto RJ45
Gi0/1     To_SW1             connected    trunk      a-full   auto RJ45
Gi0/2                        notconnect   1          a-full   auto RJ45
Gi0/3                        notconnect   1          a-full   auto RJ45
Gi1/0                        notconnect   1          a-full   auto RJ45
Gi1/1                        notconnect   1          a-full   auto RJ45
Gi1/2                        notconnect   1          a-full   auto RJ45
Gi1/3                        notconnect   1          a-full   auto RJ45
Gi2/0                        notconnect   1          a-full   auto RJ45
Gi2/1                        notconnect   1          a-full   auto RJ45
Gi2/2                        notconnect   1          a-full   auto RJ45
Gi2/3                        notconnect   1          a-full   auto RJ45
Gi3/0                        notconnect   1          a-full   auto RJ45
Gi3/1                        notconnect   1          a-full   auto RJ45
Gi3/2                        notconnect   1          a-full   auto RJ45
Gi3/3                        notconnect   1          a-full   auto RJ45

SW2#show spanning-tree summary
Switch is in pvst mode
Root bridge for: none
Extended system ID                      is enabled
Portfast Default                        is disabled
Portfast Edge BPDU Guard Default        is disabled
Portfast Edge BPDU Filter Default       is disabled
Loopguard Default                       is disabled
PVST Simulation Default                 is enabled but inactive in pvst mode
Bridge Assurance                        is enabled but inactive in pvst mode
EtherChannel misconfig guard            is enabled
Configured Pathcost method used is short
UplinkFast                              is disabled
BackboneFast                            is disabled

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
VLAN0001                     0         0        0         16         16
VLAN0010                     0         0        0          2          2
VLAN0011                     0         0        0          2          2
VLAN0022                     0         0        0          2          2
VLAN0033                     0         0        0          2          2
---------------------- -------- --------- -------- ---------- ----------

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
5 vlans                      0         0        0         24         24

SW3#sh cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
SW4              Gig 0/0           140             R S I            Gig 0/3
SW1              Gig 0/1           174             R S I            Gig 0/3

SW3#sh int status

Port      Name               Status       Vlan       Duplex  Speed Type
Gi0/0     To_SW4             connected    trunk      a-full   auto RJ45
Gi0/1     To_SW1             connected    trunk      a-full   auto RJ45
Gi0/2                        notconnect   1          a-full   auto RJ45
Gi0/3                        notconnect   1          a-full   auto RJ45
Gi1/0                        notconnect   1          a-full   auto RJ45
Gi1/1                        notconnect   1          a-full   auto RJ45
Gi1/2                        notconnect   1          a-full   auto RJ45
Gi1/3                        notconnect   1          a-full   auto RJ45
Gi2/0                        notconnect   1          a-full   auto RJ45
Gi2/1                        notconnect   1          a-full   auto RJ45
Gi2/2                        notconnect   1          a-full   auto RJ45
Gi2/3                        notconnect   1          a-full   auto RJ45
Gi3/0                        notconnect   1          a-full   auto RJ45
Gi3/1                        notconnect   1          a-full   auto RJ45
Gi3/2                        notconnect   1          a-full   auto RJ45
Gi3/3                        notconnect   1          a-full   auto RJ45

SW3#sh spanning-tree summary
Switch is in pvst mode
Root bridge for: none
Extended system ID                      is enabled
Portfast Default                        is disabled
Portfast Edge BPDU Guard Default        is disabled
Portfast Edge BPDU Filter Default       is disabled
Loopguard Default                       is disabled
PVST Simulation Default                 is enabled but inactive in pvst mode
Bridge Assurance                        is enabled but inactive in pvst mode
EtherChannel misconfig guard            is enabled
Configured Pathcost method used is short
UplinkFast                              is disabled
BackboneFast                            is disabled

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
VLAN0001                     0         0        0         16         16
VLAN0010                     0         0        0          2          2
VLAN0011                     0         0        0          2          2
VLAN0022                     0         0        0          2          2
VLAN0033                     0         0        0          2          2
---------------------- -------- --------- -------- ---------- ----------

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
5 vlans                      0         0        0         24         24


SW4#sh cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
SW2              Gig 0/2           135             R S I            Gig 0/0
SW3              Gig 0/3           160             R S I            Gig 0/0
R1               Gig 0/0           172               R    7206VXR   Gig 1/0

SW4#sh int status

Port      Name               Status       Vlan       Duplex  Speed Type
Gi0/0     To_R1              connected    trunk      a-full   auto RJ45
Gi0/1                        notconnect   1          a-full   auto RJ45
Gi0/2     To_SW2             connected    trunk      a-full   auto RJ45
Gi0/3     To_SW3             connected    trunk      a-full   auto RJ45
Gi1/0                        notconnect   1          a-full   auto RJ45
Gi1/1                        notconnect   1          a-full   auto RJ45
Gi1/2                        notconnect   1          a-full   auto RJ45
Gi1/3                        notconnect   1          a-full   auto RJ45
Gi2/0                        notconnect   1          a-full   auto RJ45
Gi2/1                        notconnect   1          a-full   auto RJ45
Gi2/2                        notconnect   1          a-full   auto RJ45
Gi2/3                        notconnect   1          a-full   auto RJ45
Gi3/0                        notconnect   1          a-full   auto RJ45
Gi3/1                        notconnect   1          a-full   auto RJ45
Gi3/2                        notconnect   1          a-full   auto RJ45
Gi3/3                        notconnect   1          a-full   auto RJ45


SW4#sh spanning-tree summary
Switch is in pvst mode
Root bridge for: VLAN0001, VLAN0010-VLAN0011, VLAN0022, VLAN0033
Extended system ID                      is enabled
Portfast Default                        is disabled
Portfast Edge BPDU Guard Default        is disabled
Portfast Edge BPDU Filter Default       is disabled
Loopguard Default                       is disabled
PVST Simulation Default                 is enabled but inactive in pvst mode
Bridge Assurance                        is enabled but inactive in pvst mode
EtherChannel misconfig guard            is enabled
Configured Pathcost method used is short
UplinkFast                              is disabled
BackboneFast                            is disabled

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
VLAN0001                     0         0        0         16         16
VLAN0010                     0         0        0          3          3
VLAN0011                     0         0        0          3          3
VLAN0022                     0         0        0          3          3
VLAN0033                     0         0        0          3          3
---------------------- -------- --------- -------- ---------- ----------

Name                   Blocking Listening Learning Forwarding STP Active
---------------------- -------- --------- -------- ---------- ----------
5 vlans                      0         0        0         28         28

R1#sh run | i interface|ip address|description
interface Loopback0
 ip address 172.16.0.1 255.255.255.255
interface FastEthernet0/0
 no ip address
interface GigabitEthernet1/0
 description To_LAN-1_SW4
 no ip address
interface GigabitEthernet1/0.10
 description MGMT
 ip address 172.16.10.1 255.255.255.0
interface GigabitEthernet1/0.11
 description PC-VLAN-11
 ip address 172.16.11.1 255.255.255.0
interface GigabitEthernet1/0.22
 description PC-VLAN-22
 ip address 172.16.22.1 255.255.255.0
interface GigabitEthernet1/0.33
 description PC-VLAN-33
 ip address 172.16.33.1 255.255.255.0
interface GigabitEthernet2/0
 description to CE1
 ip address 192.168.1.1 255.255.255.252
interface GigabitEthernet3/0
 no ip address
interface GigabitEthernet4/0
 no ip address
interface GigabitEthernet5/0
 no ip address
interface GigabitEthernet6/0
 no ip address

R1#sh run | s dhcp
ip dhcp pool VLAN11
 network 172.16.11.0 255.255.255.0
 default-router 172.16.11.1
ip dhcp pool VLAN22
 network 172.16.22.0 255.255.255.0
 default-router 172.16.22.1
ip dhcp pool VLAN33
 network 172.16.33.0 255.255.255.0
 default-router 172.16.33.1

R1#sh run | s router
router ospf 1
 router-id 172.16.0.1
 network 172.16.10.0 0.0.0.255 area 1
 network 172.16.11.0 0.0.0.255 area 1
 network 172.16.22.0 0.0.0.255 area 1
 network 172.16.33.0 0.0.0.255 area 1
 network 192.168.1.0 0.0.0.3 area 0

R1#show ip ospf neighbor

Neighbor ID     Pri   State           Dead Time   Address         Interface
172.16.0.2        1   FULL/DR         00:00:32    192.168.1.2     GigabitEthernet2/0

R1#show ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP
       + - replicated route, % - next hop override

Gateway of last resort is 192.168.1.2 to network 0.0.0.0

S*    0.0.0.0/0 [1/0] via 192.168.1.2
      172.16.0.0/16 is variably subnetted, 9 subnets, 2 masks
C        172.16.0.1/32 is directly connected, Loopback0
C        172.16.10.0/24 is directly connected, GigabitEthernet1/0.10
L        172.16.10.1/32 is directly connected, GigabitEthernet1/0.10
C        172.16.11.0/24 is directly connected, GigabitEthernet1/0.11
L        172.16.11.1/32 is directly connected, GigabitEthernet1/0.11
C        172.16.22.0/24 is directly connected, GigabitEthernet1/0.22
L        172.16.22.1/32 is directly connected, GigabitEthernet1/0.22
C        172.16.33.0/24 is directly connected, GigabitEthernet1/0.33
L        172.16.33.1/32 is directly connected, GigabitEthernet1/0.33
      192.168.1.0/24 is variably subnetted, 2 subnets, 2 masks
C        192.168.1.0/30 is directly connected, GigabitEthernet2/0
L        192.168.1.1/32 is directly connected, GigabitEthernet2/0


CE1#sh run | i interface|description|ip address
interface Loopback0
 ip address 172.16.0.2 255.255.255.255
interface FastEthernet0/0
 no ip address
interface GigabitEthernet1/0
 description Link_to_ISP-1-1
 ip address 10.0.0.2 255.255.255.252
interface GigabitEthernet2/0
 description Link_to_R1
 ip address 192.168.1.2 255.255.255.252
interface GigabitEthernet3/0
 no ip address
interface GigabitEthernet4/0
 no ip address
interface GigabitEthernet5/0
 no ip address
interface GigabitEthernet6/0
 no ip address

router ospf 1
 router-id 172.16.0.2
router bgp 65001
 bgp log-neighbor-changes
 network 10.0.0.0 mask 255.255.255.252
 neighbor 10.0.0.1 remote-as 65000

CE1#show ip ospf neighbor

Neighbor ID     Pri   State           Dead Time   Address         Interface
172.16.0.1        1   FULL/BDR        00:00:36    192.168.1.1     GigabitEthernet2/0

CE1#show ip bgp topology *
For address family: IPv4 Unicast

BGP table version is 2, local router ID is 172.16.0.2
Status codes: s suppressed, d damped, h history, * valid, > best, i - internal,
              r RIB-failure, S Stale, m multipath, b backup-path, f RT-Filter,
              x best-external, a additional-path, c RIB-compressed,
Origin codes: i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

     Network          Next Hop            Metric LocPrf Weight Path
 *>  10.0.0.0/30      0.0.0.0                  0         32768 i

CE1#show ip bgp su
CE1#show ip bgp summary
BGP router identifier 172.16.0.2, local AS number 65001
BGP table version is 2, main routing table version 2
1 network entries using 144 bytes of memory
1 path entries using 80 bytes of memory
1/1 BGP path/bestpath attribute entries using 136 bytes of memory
0 BGP route-map cache entries using 0 bytes of memory
0 BGP filter-list cache entries using 0 bytes of memory
BGP using 360 total bytes of memory
BGP activity 1/0 prefixes, 1/0 paths, scan interval 60 secs

Neighbor        V           AS MsgRcvd MsgSent   TblVer  InQ OutQ Up/Down  State/PfxRcd
10.0.0.1        4        65000       0       0        1    0    0 never    Idle

CE1#sh ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP
       + - replicated route, % - next hop override

Gateway of last resort is not set

      10.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C        10.0.0.0/30 is directly connected, GigabitEthernet1/0
L        10.0.0.2/32 is directly connected, GigabitEthernet1/0
      172.16.0.0/16 is variably subnetted, 6 subnets, 3 masks
C        172.16.0.2/32 is directly connected, Loopback0
O IA     172.16.10.0/24 [110/2] via 192.168.1.1, 01:17:06, GigabitEthernet2/0
S        172.16.10.0/25 [1/0] via 192.168.1.1
O IA     172.16.11.0/24 [110/2] via 192.168.1.1, 01:17:06, GigabitEthernet2/0
O IA     172.16.22.0/24 [110/2] via 192.168.1.1, 01:17:06, GigabitEthernet2/0
O IA     172.16.33.0/24 [110/2] via 192.168.1.1, 01:17:06, GigabitEthernet2/0
      192.168.1.0/24 is variably subnetted, 2 subnets, 2 masks
C        192.168.1.0/30 is directly connected, GigabitEthernet2/0
L        192.168.1.2/32 is directly connected, GigabitEthernet2/0

ISP-CORE-1#show run | i interface|description|isis|ip address|mpls
mpls label protocol ldp
interface Loopback0
 ip address 1.115.115.1 255.255.255.255
 ip router isis CORE
interface FastEthernet0/0
 no ip address
interface GigabitEthernet1/0
 description ISP-PE-1
 ip address 10.115.1.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet2/0
 no ip address
interface GigabitEthernet3/0
 description ISP-PE-3
 ip address 10.115.3.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet4/0
 description ISP-PE-2
 ip address 10.115.2.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet5/0
 description ISP-PE-4
 ip address 10.115.4.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet6/0
 no ip address

router isis CORE
 net 49.0001.1150.1150.1150.00
 is-type level-2-only
 metric-style wide
 log-adjacency-changes

ISP-CORE-1#show ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP
       + - replicated route, % - next hop override

Gateway of last resort is not set

      1.0.0.0/32 is subnetted, 1 subnets
C        1.115.115.1 is directly connected, Loopback0
      2.0.0.0/32 is subnetted, 1 subnets
i L2     2.115.115.1 [115/20] via 10.115.1.2, 01:22:25, GigabitEthernet1/0
      3.0.0.0/32 is subnetted, 1 subnets
i L2     3.115.115.1 [115/20] via 10.115.2.2, 01:22:15, GigabitEthernet4/0
      4.0.0.0/32 is subnetted, 1 subnets
i L2     4.115.115.1 [115/20] via 10.115.3.2, 01:22:15, GigabitEthernet3/0
      5.0.0.0/32 is subnetted, 1 subnets
i L2     5.115.115.1 [115/20] via 10.115.4.2, 01:22:25, GigabitEthernet5/0
      10.0.0.0/8 is variably subnetted, 14 subnets, 2 masks
C        10.115.1.0/30 is directly connected, GigabitEthernet1/0
L        10.115.1.1/32 is directly connected, GigabitEthernet1/0
C        10.115.2.0/30 is directly connected, GigabitEthernet4/0
L        10.115.2.1/32 is directly connected, GigabitEthernet4/0
C        10.115.3.0/30 is directly connected, GigabitEthernet3/0
L        10.115.3.1/32 is directly connected, GigabitEthernet3/0
C        10.115.4.0/30 is directly connected, GigabitEthernet5/0
L        10.115.4.1/32 is directly connected, GigabitEthernet5/0
i L2     10.115.12.0/30 [115/20] via 10.115.2.2, 01:22:15, GigabitEthernet4/0
                        [115/20] via 10.115.1.2, 01:22:15, GigabitEthernet1/0
i L2     10.115.13.0/30 [115/20] via 10.115.3.2, 01:22:15, GigabitEthernet3/0
                        [115/20] via 10.115.1.2, 01:22:15, GigabitEthernet1/0
i L2     10.115.14.0/30 [115/20] via 10.115.4.2, 01:22:25, GigabitEthernet5/0
                        [115/20] via 10.115.1.2, 01:22:25, GigabitEthernet1/0
i L2     10.115.23.0/30 [115/20] via 10.115.3.2, 01:22:15, GigabitEthernet3/0
                        [115/20] via 10.115.2.2, 01:22:15, GigabitEthernet4/0
i L2     10.115.24.0/30 [115/20] via 10.115.4.2, 01:22:15, GigabitEthernet5/0
                        [115/20] via 10.115.2.2, 01:22:15, GigabitEthernet4/0
i L2     10.115.34.0/30 [115/20] via 10.115.4.2, 01:22:15, GigabitEthernet5/0
                        [115/20] via 10.115.3.2, 01:22:15, GigabitEthernet3/0

ISP-CORE-1#sh mpls forwarding-table
Local      Outgoing   Prefix           Bytes Label   Outgoing   Next Hop
Label      Label      or Tunnel Id     Switched      interface
16         Pop Label  5.115.115.1/32   0             Gi5/0      10.115.4.2
17         Pop Label  2.115.115.1/32   0             Gi1/0      10.115.1.2
18         Pop Label  10.115.14.0/30   0             Gi1/0      10.115.1.2
           Pop Label  10.115.14.0/30   0             Gi5/0      10.115.4.2
19         Pop Label  10.115.24.0/30   0             Gi5/0      10.115.4.2
           No Label   10.115.24.0/30   0             Gi4/0      10.115.2.2
20         Pop Label  10.115.34.0/30   0             Gi5/0      10.115.4.2
           No Label   10.115.34.0/30   0             Gi3/0      10.115.3.2
21         Pop Label  10.115.12.0/30   0             Gi1/0      10.115.1.2
           No Label   10.115.12.0/30   0             Gi4/0      10.115.2.2
22         Pop Label  10.115.13.0/30   0             Gi1/0      10.115.1.2
           No Label   10.115.13.0/30   0             Gi3/0      10.115.3.2
23         No Label   3.115.115.1/32   0             Gi4/0      10.115.2.2
24         No Label   4.115.115.1/32   0             Gi3/0      10.115.3.2
25         No Label   10.115.23.0/30   0             Gi4/0      10.115.2.2
           No Label   10.115.23.0/30   0             Gi3/0      10.115.3.2

ISP-PE-1#show run | i interface|description|isis|ip address|mpls
mpls label protocol ldp
interface Loopback0
 ip address 2.115.115.1 255.255.255.255
 ip router isis CORE
interface FastEthernet0/0
 no ip address
interface GigabitEthernet1/0
 description CE1
 ip address 10.0.0.1 255.255.255.252
interface GigabitEthernet2/0
 description ISP-CORE-1
 ip address 10.115.1.2 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet3/0
 description ISP-PE-3
 ip address 10.115.13.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet4/0
 description ISP-PE-2
 ip address 10.115.12.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet5/0
 description ISP-PE-4
 ip address 10.115.14.1 255.255.255.252
 ip router isis CORE
 mpls ip
 isis network point-to-point
interface GigabitEthernet6/0
 no ip address
router isis CORE
mpls ldp router-id Loopback0 force

router isis CORE
 net 49.0001.1150.1150.1151.00
 is-type level-2-only
 metric-style wide
 log-adjacency-changes
router bgp 65000
 bgp log-neighbor-changes
 network 10.0.0.0 mask 255.255.255.252
 neighbor 10.0.0.2 remote-as 65001

ISP-PE-1#sh ip route
Codes: L - local, C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route, H - NHRP, l - LISP
       + - replicated route, % - next hop override

Gateway of last resort is not set

      1.0.0.0/32 is subnetted, 1 subnets
i L2     1.115.115.1 [115/20] via 10.115.1.1, 01:26:06, GigabitEthernet2/0
      2.0.0.0/32 is subnetted, 1 subnets
C        2.115.115.1 is directly connected, Loopback0
      3.0.0.0/32 is subnetted, 1 subnets
i L2     3.115.115.1 [115/20] via 10.115.12.2, 01:25:56, GigabitEthernet4/0
      4.0.0.0/32 is subnetted, 1 subnets
i L2     4.115.115.1 [115/20] via 10.115.13.2, 01:25:56, GigabitEthernet3/0
      5.0.0.0/32 is subnetted, 1 subnets
i L2     5.115.115.1 [115/20] via 10.115.14.2, 01:26:06, GigabitEthernet5/0
      10.0.0.0/8 is variably subnetted, 14 subnets, 2 masks
C        10.115.1.0/30 is directly connected, GigabitEthernet2/0
L        10.115.1.2/32 is directly connected, GigabitEthernet2/0
i L2     10.115.2.0/30 [115/20] via 10.115.12.2, 01:25:56, GigabitEthernet4/0
                       [115/20] via 10.115.1.1, 01:25:56, GigabitEthernet2/0
i L2     10.115.3.0/30 [115/20] via 10.115.13.2, 01:25:56, GigabitEthernet3/0
                       [115/20] via 10.115.1.1, 01:25:56, GigabitEthernet2/0
i L2     10.115.4.0/30 [115/20] via 10.115.14.2, 01:26:06, GigabitEthernet5/0
                       [115/20] via 10.115.1.1, 01:26:06, GigabitEthernet2/0
C        10.115.12.0/30 is directly connected, GigabitEthernet4/0
L        10.115.12.1/32 is directly connected, GigabitEthernet4/0
C        10.115.13.0/30 is directly connected, GigabitEthernet3/0
L        10.115.13.1/32 is directly connected, GigabitEthernet3/0
C        10.115.14.0/30 is directly connected, GigabitEthernet5/0
L        10.115.14.1/32 is directly connected, GigabitEthernet5/0
i L2     10.115.23.0/30 [115/20] via 10.115.13.2, 01:25:56, GigabitEthernet3/0
                        [115/20] via 10.115.12.2, 01:25:56, GigabitEthernet4/0
i L2     10.115.24.0/30 [115/20] via 10.115.14.2, 01:25:56, GigabitEthernet5/0
                        [115/20] via 10.115.12.2, 01:25:56, GigabitEthernet4/0
i L2     10.115.34.0/30 [115/20] via 10.115.14.2, 01:25:56, GigabitEthernet5/0
                        [115/20] via 10.115.13.2, 01:25:56, GigabitEthernet3/0

ISP-PE-1#sh mpls forwarding-table
Local      Outgoing   Prefix           Bytes Label   Outgoing   Next Hop
Label      Label      or Tunnel Id     Switched      interface
16         Pop Label  5.115.115.1/32   0             Gi5/0      10.115.14.2
17         Pop Label  1.115.115.1/32   0             Gi2/0      10.115.1.1
18         Pop Label  10.115.4.0/30    0             Gi2/0      10.115.1.1
           Pop Label  10.115.4.0/30    0             Gi5/0      10.115.14.2
19         Pop Label  10.115.24.0/30   0             Gi5/0      10.115.14.2
           No Label   10.115.24.0/30   0             Gi4/0      10.115.12.2
20         Pop Label  10.115.34.0/30   0             Gi5/0      10.115.14.2
           No Label   10.115.34.0/30   0             Gi3/0      10.115.13.2
21         Pop Label  10.115.2.0/30    0             Gi2/0      10.115.1.1
           No Label   10.115.2.0/30    0             Gi4/0      10.115.12.2
22         Pop Label  10.115.3.0/30    0             Gi2/0      10.115.1.1
           No Label   10.115.3.0/30    0             Gi3/0      10.115.13.2
23         No Label   3.115.115.1/32   0             Gi4/0      10.115.12.2
24         No Label   4.115.115.1/32   0             Gi3/0      10.115.13.2
25         No Label   10.115.23.0/30   0             Gi4/0      10.115.12.2
           No Label   10.115.23.0/30   0             Gi3/0      10.115.13.2

ISP-PE-1#sh vrf brief
  Name                             Default RD          Protocols   Interfaces
  CE1                              100:1               ipv4        Gi1/0
ISP-PE-1#
ISP-PE-1#
ISP-PE-1#
ISP-PE-1#sh run | s vrf
ip vrf CE1
 rd 100:1
 route-target export 100:1
 route-target import 100:1
 ip vrf forwarding CE1

ISP-PE-2#show run | i interface|description|isis|ip address|mpls
mpls label protocol ldp
interface Loopback0
 ip address 3.115.115.1 255.255.255.255
 ip router isis CORE
interface FastEthernet0/0
 no ip address
interface GigabitEthernet1/0
 description ISP-PE-1
 ip address 10.115.12.2 255.255.255.252
 ip router isis CORE
 isis network point-to-point
interface GigabitEthernet2/0
 description ISP-CORE-1
 ip address 10.115.2.2 255.255.255.252
 ip router isis CORE
 isis network point-to-point
interface GigabitEthernet3/0
 description ISP-PE-3
 ip address 10.115.23.1 255.255.255.252
 ip router isis CORE
 isis network point-to-point
interface GigabitEthernet4/0
 no ip address
interface GigabitEthernet5/0
 description ISP-PE-4
 ip address 10.115.24.1 255.255.255.252
 ip router isis CORE
 isis network point-to-point
interface GigabitEthernet6/0
 description CE2
 ip address 172.16.90.90 255.255.255.252
