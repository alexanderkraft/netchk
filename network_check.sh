#!/bin/bash

LOGNAME='check_net'
#TIMESTAMP=$(date +%d%m%y%H%M)
TIMESTAMP=$(date +%y%m%d%H%M)
LOGDIR=/home/hans
LOGFILE=${LOGNAME}.${TIMESTAMP}
touch $LOGDIR/$LOGFILE


while true; do PING_RESULT_1=$(/bin/ping -q -c1 -w3 192.168.79.1 2>&1) > /dev/null || echo "$PING_RESULT_1 : 192.168.79.1 ping failed at $(date +%d/%m/%y) $(date +%H:%M:%S)" >>  $LOGFILE; sleep 10; done  &

while true; do PING_RESULT_2=$(/bin/ping -q -c1 -w3 192.168.79.2 2>&1) > /dev/null || echo "$PING_RESULT_2 : 192.168.79.2 ping failed at $(date +%d/%m/%y) $(date +%H:%M:%S)" >>  $LOGFILE; sleep 10; done &

while true; do PING_RESULT_3=$(/bin/ping -q -c1 -w3 8.8.8.8 2>&1 > /dev/null) || echo "$PING_RESULT_3 : 8.8.8.8 ping failed at $(date +%d/%m/%y) $(date +%H:%M:%S)" >>  $LOGFILE; sleep 10; done &


