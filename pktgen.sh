#!/bin/bash

export RTE_SDK=dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc
cd Pktgen-DPDK
export PKTGEN_DIR=$(pwd)
export PKG_CONFIG_PATH=/scratch/pding/opt/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH
git checkout pktgen-19.00.0


make -j
