#!/bin/bash

#need this for $ROOT
source ./shared.sh
VERSION=23.03.0

rm -rf pktgen-dpdk-pktgen-$VERSION

wget https://git.dpdk.org/apps/pktgen-dpdk/snapshot/pktgen-dpdk-pktgen-$VERSION.tar.gz
tar -xf pktgen-dpdk-pktgen-$VERSION.tar.gz

rm -rf pktgen-dpdk-pktgen-$VERSION.tar.gz

cd pktgen-dpdk-pktgen-$VERSION

export RTE_SDK=${ROOT}/dpdk
export RTE_TARGET=arm64-armv8-linux-gcc
export PKTGEN_DIR=${ROOT}/pktgen-dpdk-pktgen-$VERSION
export PKG_CONFIG_PATH=/scratch/pding/opt/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH

make -j
