#!/bin/bash
source ../../shared.sh

pktgen=$PKTGEN_DPDK/app/pktgen

CORES=0x8000000000

sudo $pktgen -l 1 -n 3 -- -P -m "[1:3].0, [2:4].1"
