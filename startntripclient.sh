#!/bin/bash

# Output all commands that are run for debugging purposes
set -x

DATE_START=`date -u '+%s'`
SLEEP_MIN=10     # Wait min sec for next reconnect try
SLEEP_MAX=10000  # Wait max sec for next reconnect try
(while true; do
     ./ntripclient \
         ${NTRIP_HOST:+--server ${NTRIP_HOST}} \
         ${NTRIP_PORT:+--port ${NTRIP_PORT}} \
         ${NTRIP_MOUNTPOINT:+--mountpoint ${NTRIP_MOUNTPOINT}} \
         ${NTRIP_USERNAME:+--user ${NTRIP_USERNAME}} \
         ${NTRIP_PASSWORD:+--password ${NTRIP_PASSWORD}} \
         ${NTRIP_SERDEVICE:+--serdevice ${NTRIP_SERDEVICE}} \
         ${NTRIP_BAUD:+--baud ${NTRIP_BAUD}}

  # If exited successfully (with exit status of 0), reset the outage start time
  if test $? -eq 0; then DATE_START=`date -u '+%s'`; fi
  DATE_CURRENT=`date -u '+%s'`
  # Calculate 2% of outage time
  SLEEP_TIME=`echo ${DATE_START} ${DATE_CURRENT} | awk '{printf("%d",($2-$1)*0.02)}'`
  # Ensure we don't sleep shorter than the set minimum and maximum times
  if test ${SLEEP_TIME} -lt ${SLEEP_MIN}; then SLEEP_TIME=${SLEEP_MIN}; fi
  if test ${SLEEP_TIME} -gt ${SLEEP_MAX}; then SLEEP_TIME=${SLEEP_MAX}; fi
  sleep ${SLEEP_TIME}
done)
