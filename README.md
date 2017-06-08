# Debian Working System for Docker

This is a simple set of images that transform the standard Docker
Debian environment into one that provides more traditional full
Unix APIs (including syslog, zombie process collection, etc.)

It is based on the concepts, but not the code, in the
[phusion baseimage-docker](https://github.com/phusion/baseimage-docker).
You can look at that link for the reason this is necessary.

This image uses sysvinit instead of systemd, not because of any
particular opinion on the merits of them, but rather because
sysvinit does not require any kind of privileged Docker
or cgroups access.  

Here are the images I provide from this repository:

- jgoerzen/debian-base-minimal
  - Provides working sysvinit, syslogd, cron and at, and logrotate.
  - syslogd is configured to output to the docker log system by default.
- jgoerzen/debian-base-standard - everything above, plus:
  - Utilities: less, nano, vim-tiny
  - Email: exim4-daemon-light, mailx
  - Network: netcat-openbsd, socat, openssl, ssh
- jgoerzen/debian-base-security - everything above, plus:
  - automated security patches using unattended-upgrades and needrestart
  - debian-security-support
  - debsecan installed

# Install

You can install with:

    docker pull jgoerzen/debian-base-whatever

Your Dockerfile should use CMD to run `/usr/local/bin/boot-debian-base`.

When running, use `-t` to enable the logging to `docker logs`

# Configuration

email is the main thing you'd need to configure.  In the running system,
`dpkg-reconfigure -plow exim4-config` will let you do this.

# Source

This is prepared by John Goerzen <jgoerzen@complete.org> and the source
can be found at https://github.com/jgoerzen/docker-debian-base

# Copyright

Docker scripts, etc. are
Copyright (c) 2017 John Goerzen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Additional software copyrights as noted.

