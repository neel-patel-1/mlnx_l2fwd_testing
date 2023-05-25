#!/bin/bash

#need this for $ROOT
source ./shared.sh


cd Pktgen-DPDK
git checkout pktgen-22.07.0

export RTE_SDK=../dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc
export PKTGEN_DIR=$(pwd)
export PKG_CONFIG_PATH=/scratch/pding/opt/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

make clean buildlua -j
