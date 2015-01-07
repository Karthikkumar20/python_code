#!/bin/bash

eng_lab_ids=$1
eng_lab_id=(${eng_lab_ids//,/ })
ips=()
a=0
for Host in "${eng_lab_id[@]}"
do
ip=`get_lab_info -H $Host | grep LAN_IPADDR | sed 's/...........//'`
echo $ip
ips[a]=$ip
a=$((a+1))
done
echo $ips
