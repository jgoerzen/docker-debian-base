FROM jgoerzen/debian-base-apache:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
RUN apt-get update && \
    apt-get -y --no-install-recommends install libapache2-mod-php && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

CMD ["/usr/local/bin/boot-debian-base"]

