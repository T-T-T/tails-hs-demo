#!/bin/sh

echo HiddenServiceDir /var/lib/tor/hidden_service/ >> /etc/tor/torrc
echo HiddenServicePort 80 127.0.0.1:8080 >> /etc/tor/torrc

iptables -I OUTPUT -o lo -p tcp --dport 8080 -j ACCEPT

/usr/local/sbin/restart-tor
sleep 2
/usr/local/sbin/restart-vidalia

echo http://`cat /var/lib/tor/hidden_service/hostname`
