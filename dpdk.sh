#!/bin/bash

# remove old submodules
rm -rf dpdk
rm -rf Pktgen-DPDK

# Initialize dpdk module
git submodule init
git submodule update --recursive

cd dpdk
git checkout v22.11.1
meson -Dplatform=native -Denable_lua=true -Denable_drivers=mlx5_core,qat -Dexamples=all build
cd build
ninja

