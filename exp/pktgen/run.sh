#!/bin/bash
source ../../shared.sh

pktgen=$PKTGEN/usr/local/bin/pktgen


sudo $pktgen -l 0-2 -n 3 -- -P -m "[1:2].0 "
