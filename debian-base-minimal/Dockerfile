FROM debian:sid
MAINTAINER John Goerzen <jgoerzen@complete.org>
# We have to use sysvinit because Docker doesn't support cgroups.
# See http://without-systemd.org/wiki/index.php/Debian_Stretch
# Concepts from https://github.com/phusion/baseimage-docker

COPY setup/ /usr/local/debian-base-setup/
COPY files/ /usr/local/debian-base-setup/files/
COPY scripts /usr/local/bin
RUN /usr/local/debian-base-setup/010-debian-base-minimal.sh
COPY preinit /usr/local/preinit

CMD ["/usr/local/bin/boot-debian-base"]

