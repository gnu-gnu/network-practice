#!/bin/bash
source /run/flannel/subnet.env
CONFIG='{"bip": "'$FLANNEL_SUBNET'", "mtu": '"$FLANNEL_MTU"'}'
echo $CONFIG > /etc/docker/daemon.json
systemctl restart docker
