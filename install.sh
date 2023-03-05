#!/usr/bin/env bash

cp aws-ddns.default /etc/default/aws-ddns
cp aws-ddns /usr/local/sbin/
chmod 755 /usr/local/sbin/aws-ddns
cp aws-ddns.service aws-ddns.timer /etc/systemd/system/

systemctl daemon-reload

echo "Edit /etc/default/aws-ddns to enable DDNS updates"
echo "At least add DDNS_R53_ZONE_ID and DDNS_HOSTNAME"

#vim: set ts=2 sw=2 tw=0 et syntax=sh
