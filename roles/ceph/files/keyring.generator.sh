#!/bin/bash

# This script generates a keyring file for a Ceph client.

if [ ! -f /etc/ceph/keyring.ok ]; then
  ceph-authtool --create-keyring /tmp/ceph.mon.keyring --gen-key -n mon. --cap mon 'allow *'
  ceph-authtool --create-keyring /tmp/ceph.client.admin.keyring --gen-key -n client.admin --cap mon 'allow *' --cap osd 'allow *' --cap mds 'allow *' --cap mgr 'allow *'
  ceph-authtool --create-keyring /tmp/ceph.bootstrap-osd.keyring --gen-key -n client.bootstrap-osd --cap mon 'profile bootstrap-osd' --cap mgr 'allow r'
  ceph-authtool /tmp/ceph.mon.keyring --import-keyring /tmp/ceph.client.admin.keyring
  ceph-authtool /tmp/ceph.mon.keyring --import-keyring /tmp/ceph.bootstrap-osd.keyring
fi
