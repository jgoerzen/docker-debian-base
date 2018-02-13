FROM jgoerzen/debian-base-minimal:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/020-debian-base-standard.sh

COPY preinit/ /usr/local/preinit/

CMD ["/usr/local/bin/boot-debian-base"]

