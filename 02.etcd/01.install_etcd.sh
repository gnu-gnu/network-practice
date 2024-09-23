#!/bin/bash

ETCD_VER=v3.5.16
DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
mkdir -p /opt/etcd && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /opt/etcd --strip-components=1

echo "PATH=$PATH:/opt/etcd" >> ~/.bashrc

cp etcd.service /usr/lib/systemd/system/etcd.service
systemctl daemon-reload
systemctl enable etcd --now
