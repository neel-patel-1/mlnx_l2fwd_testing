#!/bin/bash
source ../../shared.sh

L2FWD=$DPDK_BUILD/examples/dpdk-l2fwd

CORES=0x8000000000
CHANS=6
HUGEMEM=1024 #1GB hugepage memory
PORTS=0x0003
RXQ_PER_LCORE=8

run_dpdk_app $L2FWD -c${CORES} -n${CHANS} -m${HUGEMEM} --iova-mode=pa -- -p${PORTS} -q${RXQ_PER_LCORE}
