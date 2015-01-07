#!/bin/bash
sleep 30
cd /home/mreddy/testdb/test/jenkins/masstest
sh /home/mreddy/testdb/test/jenkins/masstest/command_879.sh
sleep 10
LOGFILE=`cat /home/mreddy/testdb/test/jenkins/masstest/masstestresult_879 | grep Opening | sed 's/...................// '`
sleep 10
LOGID=`basename $LOGFILE |awk -F'.' {'print $3'}`
tail -f $LOGFILE --pid $LOGID | while read LINE; do
        echo $LINE
done

exit 0

