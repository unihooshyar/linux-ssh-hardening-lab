#! /bin/bash

ssh-keygen -A

mkdir -p /var/run/sshd

exec /usr/sbin/sshd -D -e
