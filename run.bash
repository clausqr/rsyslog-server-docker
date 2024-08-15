#!/bin/bash

docker run -d --name syslog-server -p 514:514/udp simple-syslog-server lnav

