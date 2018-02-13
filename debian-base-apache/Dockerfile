FROM jgoerzen/debian-base-security
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/040-debian-base-apache

CMD ["/usr/local/bin/boot-debian-base"]

