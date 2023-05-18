#!/bin/bash

# remove old submodules
rm -rf dpdk
rm -rf Pktgen-DPDK

# Initialize dpdk module
git submodule init
git submodule update --recursive

cd dpdk
git checkout v20.11
meson -Dplatform=native -Denable_drivers=mlx5_core,qat -Dexamples=all build
cd build
ninja

cd ../../Pktgen-DPDK
git checkout pktgen-21.01.2

export RTE_SDK=../dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc
export PKTGEN_DIR=$(pwd)

export PKG_CONFIG_PATH=/scratch/pding/opt/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

cd $RTE_SDK
make install T=x86_64-native-linux-gcc
cd $PKTGEN_DIR

make -j
