#!/bin/bash

eng_lab_ids=$1
build_file=$2
eng_lab_id=(${eng_lab_ids//,/ })
for Host in "${eng_lab_id[@]}"
do
/import/tools/qa/tools/test/config_grid $Host -P /tmp/runmass/$Host -T $Host -F $build_file -c kperiyaswamy
ip=`get_lab_info -H $Host | grep LAN_IPADDR | sed 's/...........//'`
echo $ip
/usr/bin/expect <<EOF
spawn sed -i "/\b\($ip\)\b/d" /mnt/home/mreddy/.ssh/known_hosts
spawn ssh root@$ip
#######################
expect {
-re ".*Are you sure you want to continue connecting (yes/no)?.*" {
exp_send "yes\r"
exp_continue
}
-re ".*bash-4.0#.*" {
exp_send "touch /infoblox/var/debug_ssh_enabled\r"
sleep 5
exp_send "/infoblox/rc restart\r"
sleep 30
exp_send "exit\r"
}
}
interact
EOF
done
