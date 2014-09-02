#!/usr/bin/env bash
addr="${SERF_1_PORT_7946_TCP_ADDR:-$(echo $SERF_PORT_7946_TCP_ADDR)}"
port="${SERF_1_PORT_7946_TCP_PORT:-$(echo $SERF_PORT_7946_TCP_PORT)}"
cluster="${addr}:${port}"
echo "Joining cluster at '$cluster'"
serf join "${cluster}"
status=$?
if [ $status -eq 0 ]; then
    sleep 2s
fi
exit $status
