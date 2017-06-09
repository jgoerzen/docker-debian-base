FROM jgoerzen/debian-base-security:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
RUN echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get -y --no-install-recommends install apache2 ssl-cert && \
    apt-get -y --no-install-recommends -t jessie-backports install certbot python-certbot-apache \
           dehydrated dehydrated-apache2 acme-tiny acmetool letsencrypt.sh letsencrypt.sh-apache2 && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

CMD ["/usr/local/bin/boot-debian-base"]

