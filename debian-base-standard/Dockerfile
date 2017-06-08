FROM jgoerzen/debian-base-minimal
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN apt-get update && \
    apt-get -y --no-install-recommends install less nano vim-tiny exim4-daemon-light bsd-mailx && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN /usr/local/bin/docker-wipelogs

CMD ["/usr/local/bin/boot-debian-base"]

