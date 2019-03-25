FROM debian:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
# Concepts from https://github.com/phusion/baseimage-docker

COPY setup/ /usr/local/debian-base-setup/
COPY files/ /usr/local/debian-base-setup/files/
COPY scripts /usr/local/bin
RUN /usr/local/debian-base-setup/010-debian-base-minimal
COPY preinit /usr/local/preinit

CMD ["/usr/local/bin/boot-debian-base"]

