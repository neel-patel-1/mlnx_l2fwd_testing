#!/bin/bash
source ../../shared.sh

PMD=$DPDK_BUILD/app/dpdk-testpmd
mkdir logs

FWD_CORES=1
LOGICAL=80-82
CHANS=2
HUGEMEM=1024 #1GB hugepage memory
PORTS=0x0001
RXQ_PER_LCORE=8

i=0
#RECIEVED=$( $PMD -l $LOGICAL -n $CHANS -- --forward-mode=macswap --portmask=$PORTS --num-procs=$FWD_CORES --nb-cores=$FWD_CORES | grep -o 'TX-packets: [0-9]*' | head -1 | grep -o '[0-9]*')

#echo $1,$2,$3,$RECIEVED >> results.csv

perf stat -B -e L1-icache-load,L1-icache-load-misses,L1-dcache-load,L1-dcache-load-misses,cycles,instructions,stall_backend,stall_frontend,mem_access $PMD -l $LOGICAL -n $CHANS -- --forward-mode=macswap --portmask=$PORTS --num-procs=$FWD_CORES --nb-cores=$FWD_CORES 

