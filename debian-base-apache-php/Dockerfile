FROM jgoerzen/debian-base-apache:stretch-systemd
MAINTAINER John Goerzen <jgoerzen@complete.org>
COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/050-debian-base-apache-php

CMD ["/usr/local/bin/boot-debian-base"]

