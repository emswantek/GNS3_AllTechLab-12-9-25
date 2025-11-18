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








