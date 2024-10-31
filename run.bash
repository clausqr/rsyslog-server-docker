#!/bin/bash

docker run -it --rm --name syslog-server -p 514:514/udp simple-syslog-server lnav

