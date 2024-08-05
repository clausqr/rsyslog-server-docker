# Simple Docker rsyslog Server

Very basic, will listen on 514/udp and write to /var/log/syslog

1. Build
```
docker build -t simple-syslog-server .
```

2. Run
```
docker run -d --name syslog-server -p 514:514/udp simple-syslog-server
```

3. Customize
Edit the `rsyslog.conf` file to change the configuration.
