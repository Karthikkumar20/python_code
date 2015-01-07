#!/bin/bash 

value=$1
echo $value
/usr/bin/expect <<EOF
spawn sed -i "/\b\($value\)\b/d" /mnt/home/mreddy/.ssh/known_hosts
spawn ssh root@$value
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
