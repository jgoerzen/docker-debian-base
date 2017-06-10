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
#
# Rename /sbin/init so we can use telinit to restart the thing.
#
RUN dpkg-divert --local --divert /etc/syslog.conf.internal --rename /etc/syslog.conf && \
    dpkg-divert --local --divert /sbin/init.real --rename /sbin/init && \
    dpkg-divert --local --divert /sbin/sulogin.real --rename /sbin/sulogin

# Disable some init scripts that aren't relevant in Docker.

RUN for DAEMON in hwclock.sh mountall-bootclean.sh mountall.sh \
        checkroot-bootclean.sh checkfs.sh checkroot.sh motd bootlogs \
        mountdevsubfs.sh procps \
        hostname.sh mountkernfs.sh \
        checkfs.sh mountalol.sh urandom \
        mountnfs-bootclean.sh mountnfs.sh umountnfs.sh umountfs umountroot; do \
        update-rc.d -f $DAEMON remove || true; done

COPY syslog.conf /etc/syslog.conf.stdout
COPY scripts /usr/local/bin
COPY preinit /usr/local/preinit
COPY powerfail /etc/init.d/powerfail
COPY sulogin /sbin/sulogin
RUN /usr/local/bin/docker-wipelogs
# Don't spawn getty
RUN cp -a /etc/inittab /etc/inittab.orig && \
    sed -i 's/^\([^#].*getty\)/#\1/' /etc/inittab
# Let daemons start
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

CMD ["/usr/local/bin/boot-debian-base"]

