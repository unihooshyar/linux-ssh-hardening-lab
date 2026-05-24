#! /bin/bash
# Start SSH daemon
mkdir -p /var/run/sshd
ssh-keygen -A
exec /usr/sbin/sshd -D