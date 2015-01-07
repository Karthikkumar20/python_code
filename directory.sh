#!/bin/bash
dir=$1
directory=`basename $dir |awk -F'-' '{print $2"-" $3}'`
echo $directory
