#!/usr/bin/env bash
# Script to monitor and restart wireless access point when needed

# Find the gateway
gateway=$(/sbin/ip route | awk '/default/ { print $3 }')
# now ping for 10 seconds and count packet loss
ping -c4 $gateway > /dev/null

if [ $? != 0 ]; then
     /sbin/ifdown 'wlan0'
     sleep 5
     /sbin/ifup 'wlan0'
fi
