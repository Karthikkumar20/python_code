#!/bin/bash
sleep 30
cd /home/mreddy/testdb/test/jenkins/masstest
#/home/mreddy/Arjun/runmass/sscript/run.mass_test_upgrade masstestresult_843 /import/customer_data/support /home/mreddy/Arjun/runmass/projects/Buckets/support/New_buckets1/bucket1_1_600 10.35.3.75 > masstestresult_843 2>&1 &
sudo sh /home/mreddy/testdb/test/jenkins/masstest/command_843.sh
LOGFILE=`cat /home/mreddy/testdb/test/jenkins/masstest/masstestresult_843 | grep Opening | sed 's/...................// '`
tail -f $LOGFILE| while read LINE; do
        echo $LINE
done

exit 0
