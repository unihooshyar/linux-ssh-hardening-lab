#! /bin/bash


# Start SSH daemon
mkdir -p /var/run/sshd
/usr/sbin/sshd

exec ttyd --writable -p 7681 bash