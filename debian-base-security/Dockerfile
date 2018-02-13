FROM jgoerzen/debian-base-standard:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/030-debian-base-security.sh

CMD ["/usr/local/bin/boot-debian-base"]

