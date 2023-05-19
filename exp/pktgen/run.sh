#!/bin/bash
source ../../shared.sh

pktgen=$PKTGEN/usr/local/bin/pktgen

CORES=0xF

sudo $pktgen -l 0-4 -n 3 -- -P -m "[1:3].0, [2:4].1"
