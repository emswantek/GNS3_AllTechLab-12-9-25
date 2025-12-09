# Updated 12/9/25
# GNS3_AllTechLab
# Folders include device outputs, diagrams, and full running configs

Purpose: I created this lab from scratch to explore several technologies. 
I originally came up with this when I was working towards my CCNP in 2023.
Due to various other things going on I did not complete it then. 
After more than a year I came back to it in October 2025 detirmined to complete it. 

I utilized ChatGPT to help rapidly research implementation for protocols or device types I was not used to. I treated it like an "eager intern", one who was ready and willing to help, but was still prone to errors. I acted as the "lead network engineer" accepting/rejecting "my intern's" suggestions. This required me having a good understanding of what I was working with, and calling upon my eight years of experience in a Network Administrator role.


(completed as of 12/9/25) Initial lab scenario: Two companies have gone through a merger and the network engineers need to have PCs at their two sites communicate.  While both are connected to the same MPLS provider, the organization does not want the downtime for the ISP to reconfigure the VRFs. Having more ports on their CE routers, the network engineers procure firewalls, and an internet circuit. LAN1 is newer and smaller while LAN2 consists of a much larger, and older enterprise with multiple protocols running. The network admins sit at PC3, and PC7 respectively.

Device list:  
Cisco IOSvL2 | vios_l2-adventerprisek9-m.SSA.high_iron_20180619.qcow2   
Cisco 7200 | c7200-advipservicesk9-mz.152-4.S5.image  
Cisco NXOS | nxosv.9.3.1.qcow2  
Alpine Linux | alpine-virt-3.18.4.qcow2
Cisco ASAv 9.12 | asav9-12-2-9.qcow2

LAN1 (Cisco IOS DHCP, STP, OSPF, BGP, VTI IPSEC VPN):
3 PCs - PC1, PC2, PC3
4 Switches - SW1, SW2, SW3, SW4
2 Routers - R1, CE1
1 ASA - INET-GW-ASA1

LAN2 (Linux DHCP server, EIGRP, BGP, HSRP, vPC peering, MSTP, Crypto Map VPN)
4 PCs - PC4, PC5, PC6, PC7
1 Server - SERVER1
3 Access Switches - LAN2-ACCESS-SW1, LAN2-ACCESS-SW2, LAN2-ACCESS-SW3, LAN2-ACCESS-SW4
4 Distribution Switches - LAN2-MSTP-SW1, LAN2-MSTP-SW2, LAN2-MSTP-SW3, LAN2-MSTP-SW4
2 Datacenter Nexus switches - DC-VPC-SW1, DC-VPC-SW2
1 Datacenter layer 2 switch - DC-SW1
3 routers - EIGRP-R2, EIGRP-R3, CE2
1 Firewall - INET-GW-ASA2

MPLS ISP (IS-IS, MPLS, VRF)
ISP-CORE-1
ISP-PE-1, ISP-PE-2, ISP-PE-3, ISP-PE-4

"Ineternet" ISP (default routing to Null0)
INET-ISP-RTR

Future lab ideas with this topology: 
Have an "internet" connected resource
Use the server for DNS and other domain functions
Make all devices managable by the admin PCs
Secure devices with various publicly available hardening guidelines
Acheive inter-site connectivity via MPLS
Route maps
ACLs
QoS
Add a network monitoring server (Maybe Nagios?)
Software-Defined Networking
Nexus Fex




