#!/bin/bash
curl -LO https://github.com/flannel-io/flannel/releases/latest/download/flanneld-amd64 && \
     chmod u+x flanneld-amd64 && mkdir -p /opt/flannel && mv flanneld-amd64 /opt/flannel/flannel
mkdir -p /run/flannel && cp subnet.env /run/flannel/subnet.env
cp flannel.service /usr/lib/systemd/system/flannel.service
chcon -R -t bin_t /opt/flannel
systemctl daemon-reload
systemctl enable flannel --now
