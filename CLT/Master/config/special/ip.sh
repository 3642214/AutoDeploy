#!/bin/bash
MRPath=/home/testuser/workspace/skyFS-mapreduce
[ -d $MRPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $MRPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
vmFile=$MRPath/releases/$floder/vm.args
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/-name.*/-name MR-M@$LOCALHOST_IP/g" $vmFile