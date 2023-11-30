#!/bin/bash

#wget "http://content.mellanox.com/ofed/MLNX_OFED-4.6-1.0.1.1/MLNX_OFED_LINUX-4.6-1.0.1.1-ubuntu18.04-x86_64.tgz"
wget "http://content.mellanox.com/ofed/MLNX_OFED-23.10-0.5.5.0/MLNX_OFED_LINUX-23.10-0.5.5.0-ubuntu20.04-x86_64.tgz"
tar xvf MLNX_OFED_LINUX-23.10-0.5.5.0-ubuntu20.04-x86_64.tgz
cd MLNX_OFED_LINUX-23.10-0.5.5.0-ubuntu20.04-x86_64.tgz
#sudo ./mlnxofedinstall --add-kernel-support --dpdk --upstream-libs # it's fine to see 'Failed to install libibverbs-dev DEB'
sudo ./mlnxofedinstall --force --dpdk --upstream-libs # it's fine to see 'Failed to install libibverbs-dev DEB'
sudo /etc/init.d/openibd restart
