#!/bin/bash
MRPath=/home/testuser/workspace/skyFS-mapreduce
[ -d $MRPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $MRPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$MRPath/releases/$floder/sys.config
[ -z $1 ] || appFile=$MRPath/etc/app.config
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        netcard=`ifconfig |grep bond |wc -l`
        [ $netcard -eq 0 ] || sed -i "s/{network_card,[0-9]*},/{network_card,4}/g" $appFile