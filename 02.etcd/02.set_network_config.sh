#!/bin/bash
/opt/etcd/etcdctl put /coreos.com/network/config '{ "Network": "10.101.0.0/16", "Backend": {"Type": "vxlan"}}'
