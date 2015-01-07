#!/usr/bin/expect -f

# connect via scp
#addkeys 10.35.3.111
spawn sed -i "/\b\(10.35.112.12\)\b/d" /mnt/home/mreddy/.ssh/known_hosts
spawn ssh root@10.35.112.12
#######################
expect {
-re ".*Are you sure you want to continue connecting (yes/no)?.*" {
exp_send "yes\r"
exp_continue
}
-re ".*bash-4.0#.*" {
exp_send "touch /infoblox/var/debug_ssh_enabled\r"
exp_send "/infoblox/rc restart\r"
exp_send "exit\r"
}
}
interact

