#!/bin/bash

ips=$1
ip=(${ips//,/ })
for i in "${ip[@]}"
do
/usr/bin/expect <<EOF
spawn sed -i "/\b\($i\)\b/d" /mnt/home/mreddy/.ssh/known_hosts
spawn ssh root@$i
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
