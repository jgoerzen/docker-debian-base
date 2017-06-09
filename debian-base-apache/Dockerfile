FROM jgoerzen/debian-base-security:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
# Install python-ndg-httpsclient per #861513
RUN apt-get update && \
    apt-get -y --no-install-recommends install apache2 certbot python-certbot-apache python-ndg-httpsclient ssl-cert \
             acme-tiny  && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

CMD ["/usr/local/bin/boot-debian-base"]

