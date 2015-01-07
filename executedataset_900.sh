#!/bin/bash
cd /home/mreddy/testdb/test/jenkins/masstest
/home/mreddy/Arjun/runmass/sscript/run.mass_test_upgrade masstestresult_900 /import/customer_data/support /home/mreddy/Arjun/runmass/projects/Buckets/support/New_buckets1/bucket4_951_1050 10.35.3.132 > masstestresult_900 2>&1 &
