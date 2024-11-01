#!/bin/bash
# Start rsyslog in the background
mkdir -p /var/log
touch /var/log/syslog
rsyslogd -n &

# Tail the syslog to show output
tail -f /var/log/syslog

