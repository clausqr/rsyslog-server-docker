# 🚀 Simple Docker `rsyslog` Server + `lnav` Viewer 🎉

Welcome to your all-in-one, minimal `rsyslog` server in Docker! This container listens on `514/udp` for syslog messages, writes them to `/var/log/syslog` 📄, and launches [`lnav`](https://lnav.org/) for a live view of incoming logs. Perfect for quick setups, testing, or getting visibility into logs in real-time! 🎬

🌐 **Default Format**: Logs follow the standardized [`RFC 5242`](https://www.rfc-editor.org/rfc/rfc5424) format, but feel free to customize!

---

## 🛠️ How to Build

Start by building your Docker image:

```bash
docker build -t simple-syslog-server .
```

---

## ▶️ How to Run

Run the container in detached mode to keep it running in the background:

```bash
docker run -d --name syslog-server -p 514:514/udp simple-syslog-server
```

Or use the provided convenience script:

```bash
bash run.bash
```

✨ **Voilà!** Your syslog server is up and ready to go! 🎉

---

## 📢 How to Test

Want to check if everything’s working? 🕵️‍♀️ Use the `logger` command to send a test message:

```bash
logger -n 127.0.0.1 -P 514 -d -t test-app -p user.error "Test syslog message: lemon apple pear"
```

Now pop open `lnav` and watch your message appear in the live log viewer! 👀 🍋🍏🍐

---

## 🛠️ Customization

Need to tweak the configuration? 🎛️

Simply edit `rsyslog.conf` to customize filters, log paths, or other settings to your needs. Then rebuild and rerun the container.

---

🌟 Enjoy your streamlined syslog server setup with real-time views and easy customization. 🎉 Happy logging!


## References

* [1] https://www.rsyslog.com/doc/v8-stable/configuration/templates.html 
* [2] https://www.rsyslog.com/doc/v8-stable/configuration/modules/imudp.html
* [3] https://www.rsyslog.com/doc/v8-stable/configuration/modules/omfile.html
* [4] https://lnav.org/
* [5] https://www.rfc-editor.org/rfc/rfc5424

```