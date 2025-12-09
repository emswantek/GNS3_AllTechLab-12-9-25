#!/bin/sh
# ============================================================
# GNS3 All-Tech Lab - Alpine Linux Provisioning Script
# Run as root on a fresh Alpine VM.
#
# NOTE: In GNS3, connect *one* NIC to the NAT node so apk works.
#       Then run this script.
# ============================================================

echo "=== GNS3 Alpine Provisioning Starting ==="

### 1) Sync package index
apk update

### 2) Core tools / networking utilities
apk add \
  busybox-extras \
  iproute2 \
  openrc \
  openssh \
  dhclient \
  tcpdump \
  nmap \
  bind-tools \
  curl \
  wget \
  nano \
  bash

# OPTIONAL: DHCP server (only if this VM will serve DHCP)
# Comment this out if you’re using it as just a client / test box.
apk add dhcp

echo "=== Basic packages installed ==="

### 3) Enable networking and SSH at boot
rc-update add networking default
rc-update add sshd default

# Start SSH now (so you can immediately SSH in)
rc-service sshd start

echo "=== Networking + SSH enabled ==="

### 4) Configure DHCP client on eth0
# This assumes your primary NIC is eth0.
# Adjust if your interface is named differently (ip addr to check).

INTERFACES_FILE="/etc/network/interfaces"

# Backup if it already exists
if [ -f "$INTERFACES_FILE" ]; then
  cp "$INTERFACES_FILE" "${INTERFACES_FILE}.bak.$(date +%s)"
fi

cat > "$INTERFACES_FILE" << 'EOF'
auto lo
iface lo inet loopback

# Primary NIC - get address via DHCP (GNS3 NAT node or lab DHCP)
auto eth0
iface eth0 inet dhcp

# Add more interfaces if needed, e.g.
# auto eth1
# iface eth1 inet static
#     address 172.31.241.10
#     netmask 255.255.255.0
#     gateway 172.31.241.1
EOF

# Restart networking to apply
rc-service networking restart

echo "=== DHCP client configured on eth0 ==="

### 5) OPTIONAL: DHCP server configuration
# Only do this if this Alpine box will act as a DHCP server for a lab VLAN.
# Adjust subnet, range, router, DNS to match the lab segment it serves.

DHCPD_CONF="/etc/dhcp/dhcpd.conf"
DHCPD_CFD="/etc/conf.d/dhcpd"

cat > "$DHCPD_CONF" << 'EOF'
default-lease-time 600;
max-lease-time 7200;
authoritative;

# Example scope - CHANGE to match your lab subnet
subnet 172.31.241.0 netmask 255.255.255.0 {
    range 172.31.241.50 172.31.241.99;
    option routers 172.31.241.1;
    option broadcast-address 172.31.241.255;
    option domain-name-servers 8.8.8.8;
}
EOF

# Bind DHCP server to eth0 (change if needed)
sed -i 's/^#\?DHCPD_IFACE=.*/DHCPD_IFACE="eth0"/' "$DHCPD_CFD" 2>/dev/null || \
  echo 'DHCPD_IFACE="eth0"' > "$DHCPD_CFD"

# Enable and start DHCP server (comment out if not serving DHCP)
rc-update add dhcpd default
rc-service dhcpd restart || echo "NOTE: dhcpd may fail until eth0 is on the correct VLAN."

echo "=== DHCP server (optional) configured for eth0 ==="

### 6) SSH client tweak for older devices (e.g., ASA needing ssh-rsa)
SSH_CONFIG_DIR="/root/.ssh"
SSH_CONFIG_FILE="$SSH_CONFIG_DIR/config"

mkdir -p "$SSH_CONFIG_DIR"
chmod 700 "$SSH_CONFIG_DIR"

cat > "$SSH_CONFIG_FILE" << 'EOF'
Host asa*
    HostKeyAlgorithms ssh-rsa
    PubkeyAcceptedAlgorithms +ssh-rsa

# Generic fallback for anything old:
Host *
    ServerAliveInterval 60
EOF

chmod 600 "$SSH_CONFIG_FILE"

echo "=== SSH client config updated for ASA compatibility ==="

### 7) Hostname (optional — change to taste)
echo "alpine-lab" > /etc/hostname
hostname -F /etc/hostname

echo "=== Hostname set to alpine-lab ==="

### 8) Quick status hints
echo "=== Done. Helpful commands: ==="
echo "ip addr          # verify DHCP address from NAT/lab"
echo "ping 8.8.8.8     # confirm Internet connectivity for apk"
echo "apk info         # list installed packages"
echo "rc-status        # view running services"

echo "=== GNS3 Alpine Provisioning Complete ==="

###NAT Node Reminder (for Future You)

###Before running apk add or this script in GNS3:

###Connect one NIC of the Alpine VM to the GNS3 NAT node.

###Make sure that NIC is the one configured as eth0 in /etc/network/interfaces.

###Confirm you got an IP (after the script):

###ip addr
###ping 8.8.8.8


###If you forget the NAT node, apk will quietly fail or hang and 
###you’ll spend 20 minutes thinking the Alpine mirrors are down again.