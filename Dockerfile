# Use the official Ubuntu base image
FROM ubuntu:22.04

# Update packages and install rsyslog
RUN apt-get update && \
    apt-get install -y rsyslog && \
    rm -rf /var/lib/apt/lists/*

# Expose the default syslog port
EXPOSE 514/udp

# Copy custom rsyslog config file
COPY rsyslog.conf /etc/rsyslog.conf

# Start rsyslog in the foreground
CMD ["rsyslogd", "-n"]
