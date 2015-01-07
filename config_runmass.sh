#!/bin/bash

eng_lab_ids=$1
build_file=$2
eng_lab_id=(${eng_lab_ids//,/ })
for Host in "${eng_lab_id[@]}"
do
/import/tools/qa/tools/test/config_grid $Host -P /tmp/runmass/$Host -T $Host -F $build_file -c kperiyaswamy
done

