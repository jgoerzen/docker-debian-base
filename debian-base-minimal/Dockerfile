FROM debian:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
# We have to use sysvinit because Docker doesn't support cgroups.
# See http://without-systemd.org/wiki/index.php/Debian_Stretch
# Concepts from https://github.com/phusion/baseimage-docker
COPY systemd /etc/apt/preferences.d/systemd
RUN apt-get update && \
    apt-get -y --no-install-recommends install sysvinit-core inetutils-syslogd cron anacron at logrotate && \
    apt-get -y --no-install-recommends install psmisc procps && \
    apt-get -y remove --purge --auto-remove systemd && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN dpkg-divert --local --divert /etc/syslog.conf.internal --rename /etc/syslog.conf
COPY syslog.conf /etc/syslog.conf.stdout
COPY scripts /usr/local/bin
RUN /usr/local/bin/docker-wipelogs
# Don't spawn getty
RUN cp -a /etc/inittab /etc/inittab.orig
RUN sed -i 's/^\([^#].*getty\)/#\1/' /etc/inittab
# Let daemons start
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

CMD ["/usr/local/bin/boot-debian-base"]

