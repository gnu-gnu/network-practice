#!/bin/bash
curl -LO https://github.com/flannel-io/flannel/releases/latest/download/flanneld-amd64 && \
     chmod u+x flanneld-amd64 && mkdir -p /opt/flannel && mv -f flanneld-amd64 /opt/flannel/flannel
mkdir -p /run/flannel && cp -f subnet.env /run/flannel/subnet.env
IP=$(ip -4 addr show eth1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
sed -i "s/MY_IP/$IP/g" flannel.service
cp -f flannel.service /usr/lib/systemd/system/flannel.service
chcon -R -t bin_t /opt/flannel
systemctl daemon-reload
systemctl enable flannel --now
