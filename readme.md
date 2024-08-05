# Simple Docker `rsyslog` Server + `lnav` Viewer

Very basic, will listen on `514/udp` , write to `/var/log/syslog` inside the container and start a [`lnav`](https://lnav.org/) session to view the logs. Default logging template is [`RFC 5242`](https://www.rfc-editor.org/rfc/rfc5424).

1. Build
```
docker build -t simple-syslog-server .
```

2. Run
```
docker run -d --name syslog-server -p 514:514/udp simple-syslog-server
```

3. Test

```
logger -n <your-docker-host-ip> -P 514 -d -t test-app -p user.error "Test syslog message: lemon apple pear"
```

4. Customize


Edit the `rsyslog.conf` file to change the configuration.


## References

* [1] https://www.rsyslog.com/doc/v8-stable/configuration/templates.html 
* [2] https://www.rsyslog.com/doc/v8-stable/configuration/modules/imudp.html
* [3] https://www.rsyslog.com/doc/v8-stable/configuration/modules/omfile.html
* [4] https://lnav.org/
* [5] https://www.rfc-editor.org/rfc/rfc5424

```