#!/bin/bash
set -e
source ../../shared.sh

vtune=/opt/intel/oneapi/vtune/latest/bin64/vtune

pktgen=$PKTGEN/usr/local/bin/pktgen

count=1 
run() {
	if [[ $(echo "$(./stats.sh "stats/${1}_${2}_${3}.txt") > 0.001" | bc) -eq 1 ]]
	then
		count=$(( $count + 1 ))
	echo "MoE: $(./stats.sh "stats/${1}_${2}_${3}.txt")"
	./cfg_gen.sh $1 $2 $3 > "cfgs/${1}_${2}_${3}.pkt"
	sent=$(cat "cfgs/${1}_${2}_${3}.pkt" | grep count | grep -o "[0-9][0-9][0-9]*" | head -1)
	echo $1 $2 $3
	echo "Starting pktgen..."


	sudo $pktgen -l 1-3 -n 4 -- -P -m "[2:3].0" -f "cfgs/${1}_${2}_${3}.pkt" > /dev/null 2> /dev/null &
	echo "Starting l2fwd..."
	 

	recv=$(ssh -tt altra "cd ~/mlnx_l2fwd_testing/exp/testpmd && echo $K | sudo -S ./run.sh $3"| grep -o  "[0-9]*")
	echo $recv

	#get the last string
	recv=$(echo $recv | awk '{print $NF}') 

	echo $recv
	drop_rate=$(bc -l <<< "(1 - $recv / $sent)")
	echo $drop_rate >> "stats/${1}_${2}_${3}.txt"
	fi
}

readarray -t elements < <(cat configs.txt)


while [[ $count -gt 0 ]]
do
	count=0
for ((i = 0; i < ${#elements[@]}; i += 1)); do 
	SIZE=$(echo ${elements[i]} | grep -o "\w*" | head -1)
	RATE=$(echo ${elements[i]} | grep -o "\w*" | head -2 | tail -1)
	DUR=$(echo ${elements[i]} | grep -o "\w*" | head -3 | tail -1)
	run $SIZE $RATE $DUR

done 
done

