#!/bin/bash
CNPath=/home/testuser/workspace/skyFs-controller
[ -d $CNPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $CNPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
vmFile=$CNPath/releases/$floder/vm.args
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/-name.*/-name CN@$LOCALHOST_IP/g" $vmFile