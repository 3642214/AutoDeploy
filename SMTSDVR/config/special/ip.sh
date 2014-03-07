#!/bin/bash
SDPath=/home/testuser/workspace/smts_dvr
[ -d $SDPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $SDPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
vmFile=$SDPath/releases/$floder/vm.args
[ -z $1 ] || vmFile=$SDPath/etc/vm.args
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/-name.*/-name STMS-D@$LOCALHOST_IP/g" $vmFile