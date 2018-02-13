FROM jgoerzen/debian-base-minimal:jessie
MAINTAINER John Goerzen <jgoerzen@complete.org>
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/020-debian-base-standard

COPY preinit/ /usr/local/preinit/

CMD ["/usr/local/bin/boot-debian-base"]

