#!/bin/bash
cd /home/mreddy/testdb/test/jenkins/masstest
/home/mreddy/Arjun/runmass/sscript/mass_test_upgrade 10.35.3.75 /import/customer_data/support/6.6.9-Converted/NIOS-43546/5-30/5-30-database.bak > masstestresult_2 2>&1 &
tailf masstestresult2
