# Mellanox DPDK Profiling

Tested with:
- Mellanox OFED Version: 5.4-3.6.8 (MLNX_OFED_LINUX-5.4-3.6.8.1)
- DPDK version 21.11 <45f04d88ae8fa6217812abdaa623d66b05fc7b6a>
- Ubuntu 5.13.0-44.49~20.04.1-generic 5.13.19

## Build
Run build script
```
sudo ./deps.sh
./dpdk.sh
```

## Configure System
setup hugepages, enable userspace monitoring
```
sudo ./setup_machine.sh
```

## Run Experiments (l2fwd example)
```
cd exp/l2fwd_cache_miss
sudo ./run.sh
```

## Roadmap
Current Work:
- [x] DPDK Build Script
	- [x] Compiling Examples
- [ ] Experiment Run Scripts
	- [ ] l2fwd l2/l3 cache misses
	- [ ] Linking Against Build Tree Drivers (no system-wide install)
- [ ] Optimizations for Intel Systems: https://doc.dpdk.org/guides-21.11/linux_gsg/nic_perf_intel_platform.html

Future Work:
- [ ] Fetch Instructions
- [ ] Build Instructions
- [ ] System Configuration Validation Instructions
