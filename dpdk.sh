#!/bin/bash

# remove old submodules
rm -rf dpdk
rm -rf Pktgen-DPDK

# Initialize dpdk module
git submodule init
git submodule update --recursive

cd dpdk
git checkout v20.01
meson -Dplatform=native -Denable_drivers=mlx5_core,qat -Dexamples=all build
cd build
ninja

