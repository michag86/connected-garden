#!/bin/bash
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# if /dev/ttyUSB0 doesn't exist something is wrong -> desable and enable usb umts device
if [ ! -c /dev/ttyUSB0 ]; then 
	echo "$(date '+%Y-%m-%d %H:%M:%S'): USB-Stick deaktiveren/aktivieren"
	${__dir}/usb-modem-reconnect.sh
fi

if [ `/usr/bin/mosquitto_sub -t '$SYS/broker/connection/raspberrypi.server/state' -C 1` == 0 ] ; then 
	echo "$(date '+%Y-%m-%d %H:%M:%S'): MQTT offline (ppp0-Address: $(/sbin/ifconfig ppp0 | grep 'inet ' | awk '{ print $2}') ; tun0-Address: $(/sbin/ifconfig tun0 | grep 'inet ' | awk '{ print $2}') )"
#	/opt/scripts/vpn-reconnect.sh
else 
	touch /tmp/vpn-active
fi
if [ ! $(find /tmp/vpn-active -mmin -7): ]; then 
#	if [ ! $(find /tmp/vpn-reconnect -mmin -5) ];
		echo "$(date '+%Y-%m-%d %H:%M:%S'): Reconnecting VPN"
#		touch /tmp/vpn-reconnect
		${__dir}/vpn-reconnect.sh
#	else
#		echo "$(date '+%Y-%m-%d %H:%M:%S'): Skip Reconnect" 
#	fi
fi
