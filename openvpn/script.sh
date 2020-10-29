#!/bin/bash -x

echo "Updating ..."
apt update -y

echo "Installing require packages ..."
apt install telnet ca-certificates wget net-tools gnupg -y

echo "Adding official OpenVPN Distro ..."
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian `lsb_release -cs` main" > /etc/apt/sources.list.d/openvpn-as-repo.list 

echo "Updating again ..."
apt update -y

echo "Installing openvpn ..."
apt install openvpn-as -y

echo "Starting and enabling OpenVPN ..."
systemctl enable openvpn.service
systemctl start openvpn.service
