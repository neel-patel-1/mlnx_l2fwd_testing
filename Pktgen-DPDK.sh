#!/bin/bash

#need this for $ROOT
source ./shared.sh

# remove old submodules
rm -rf Pktgen-DPDK 


# Initialize pktgen module
git submodule init
git submodule update --recursive

cd Pktgen-DPDK
git checkout pktgen-23.03.0

export RTE_SDK=../dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc
export PKTGEN_DIR=$(pwd)
export PKG_CONFIG_PATH=/scratch/pding/opt/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

make -j
