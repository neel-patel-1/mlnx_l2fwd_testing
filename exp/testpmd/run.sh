#!/bin/bash
source ../../shared.sh

PMD=$DPDK_BUILD/examples/dpdk-l2fwd
mkdir cfgs

FWD_CORES=1
LOGICAL=80-82
CHANS=2
HUGEMEM=1024 #1GB hugepage memory
PORTS=0x0001
RXQ_PER_LCORE=8

i=0
dur=$( bc -l <<< "2 + 1.5 * $1")
timeout --foreground $dur $PMD -l $LOGICAL -n $CHANS -- -p $PORTS -T 1 | grep  'Packets sent: [0-9]*' 2> /dev/null





