#!/bin/bash
set -e
source ../../shared.sh

vtune=/opt/intel/oneapi/vtune/latest/bin64/vtune

pktgen=$PKTGEN/usr/local/bin/pktgen

run() {
	./cfg_gen.sh $1 $2 $3 > "cfgs/${1}_${2}_${3}.pkt"
	sent=$(cat "cfgs/${1}_${2}_${3}.pkt" | grep count | grep -o "[0-9][0-9][0-9]*" | head -1)


	sudo $pktgen -l 1-3 -n 4 -- -P -m "[2:3].0" -f "cfgs/${1}_${2}_${3}.pkt" > /dev/null  & 
	 
	sudo ssh altra "echo $K | sudo -S cd ~/mlnx_l2fwd_testing/exp/testpmd && sudo -S ./run.sh $3"
	sleep 10




}

readarray -t elements < <(cat configs.txt)



while read -u3 a b c; do 
	run $a $b $c
done 3< configs.txt

