# Use the official Ubuntu base image
FROM ubuntu:22.04

# Update packages and install rsyslog and utilities
RUN apt-get update && \
    apt-get install -y rsyslog moreutils lnav && \
    rm -rf /var/lib/apt/lists/*

# Expose the default syslog port
EXPOSE 514/udp

# Copy the custom rsyslog config file
COPY rsyslog.conf /etc/rsyslog.conf

# Create the log directory and ensure the log file exists
RUN mkdir -p /var/log && touch /var/log/syslog.log

# Start rsyslog in the foreground and use lnav to display logs
CMD ["sh", "-c", "rsyslogd -n & lnav /var/log/syslog.log"]

