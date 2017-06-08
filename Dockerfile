FROM debian:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
# VNC doesn't start without xfonts-base
RUN apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install supervisor inetutils-syslogd && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY supervisor/ /etc/supervisor/conf.d/
COPY scripts/ /usr/local/bin/
COPY syslog.conf /etc/syslog.conf

CMD ["/usr/local/bin/boot-supervisord"]

