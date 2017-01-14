#!/bin/bash
set -e
mkdir -p /var/run/dbus
rm -f /var/run/dbus/pid
dbus-daemon --system
if [ "${AVAHI}" == "1" ]; then
    sed -i '/rlimit-nproc/d' /etc/avahi/avahi-daemon.conf
    avahi-daemon -D
else
    echo "Skipping avahi daemon, enable with env variable AVAHI=1"
fi;

homebridge
