#!/usr/bin/expect -f

# connect via scp
#addkeys 10.35.3.111
spawn sed -i "/\b\(10.35.3.78\)\b/d" /mnt/home/mreddy/.ssh/known_hosts
spawn ssh root@10.35.3.78
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

