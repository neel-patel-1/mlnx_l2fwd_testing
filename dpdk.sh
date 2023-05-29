#!/bin/bash

VERSION=23.03

rm -rf dpdk-$VERSION/

wget http://fast.dpdk.org/rel/dpdk-$VERSION.tar.xz
tar -xf dpdk-$VERSION.tar.xz
rm -rf dpdk-$VERSION.tar.xz*

cd ./dpdk-$VERSION
meson -Dplatform=native -Denable_drivers=mlx5_core,qat -Dexamples=all build
cd build
ninja
