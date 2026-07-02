#!/bin/bash
set -e

mkdir -p /run/named
chown named:named /run/named

named-checkconf /etc/named.conf
named-checkzone example.com /var/named/example.com.zone

exec /usr/sbin/named -g -c /etc/named.conf -u named