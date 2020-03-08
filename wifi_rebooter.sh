#!/bin/bash

# check router's ip address:
SERVER=`ip route | awk '/default/ {print $3}'`

# ping the router:
ping -c2 ${SERVER} > /dev/null

# non-zero return value from ping indicates an error:
if [ $? != 0 ]
then
    # set the interface down and up again:
    ip link set wlan0 down
    ip link set wlan0 up

    # log message:
    echo "wlan0 reconnected at `date`"
fi
