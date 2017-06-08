FROM debian:stretch
MAINTAINER John Goerzen <jgoerzen@complete.org>
# We have to use sysvinit because Docker doesn't support cgroups.
# See http://without-systemd.org/wiki/index.php/Debian_Stretch
# Concepts from https://github.com/phusion/baseimage-docker
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install sysvinit-core inetutils-syslogd cron at logrotate && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY scripts/ /usr/local/bin/
COPY syslog.conf /etc/syslog.conf

CMD ["/sbin/init"]

