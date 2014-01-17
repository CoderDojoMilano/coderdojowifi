#! /bin/bash

echo "updating apt-get"
apt-get update

echo "installing udhcpd"
sudo apt-get install udhcpd
cp conf/udhcpd /etc/default/udhcpd
cp conf/udhcpd.conf /etc/udhcpd.conf

echo "installing hostapd..."
sudo apt-get install bridge-utils hostapd
wget http://www.daveconroy.com/wp3/wp-content/uploads/2013/07/hostapd.zip
unzip hostapd.zip 
sudo mv /usr/sbin/hostapd /usr/sbin/hostapd.bak
sudo mv hostapd /usr/sbin/hostapd.edimax 
sudo ln -sf /usr/sbin/hostapd.edimax /usr/sbin/hostapd 
sudo chown root.root /usr/sbin/hostapd 
sudo chmod 755 /usr/sbin/hostapd

cp conf/hostapd.conf /etc/hostapd/
echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd

echo "copying interfaces conf"
cp conf/interfaces /etc/network/interfaces

echo "copying udhcpd.conf"
cp conf/udhcpd.conf /etc/udhcpd.conf

echo "configuring ip forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "installing nginx"
apt-get nginx

echo "installing gsync tools"
sudo apt-get install python-setuptools
sudo easy_install pip
sudo pip install setuptools --no-use-wheel --upgrade
sudo pip install gsync

echo "syncing..."
time gsync --progress -u -d -r -vi drive://coderdojoSource /home/pi