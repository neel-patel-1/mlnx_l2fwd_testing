#!/bin/bash

# remove old submodules
rm -rf dpdk

# Initialize dpdk module
git submodule init
git submodule update --recursive

cd dpdk
meson -Dplatform=native -Denable_drivers=mlx5_core,qat -Dexamples=all build
cd build
ninja
