#!/bin/bash

set -e
set -x

mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
apt-get update
apt-get -y --no-install-recommends install \
        tightvncserver xfonts-base lwm xterm xdotool xvnc4viewer

apt-get -y -u dist-upgrade

apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
/usr/local/bin/docker-wipelogs

mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled
