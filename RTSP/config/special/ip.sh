#!/bin/bash
RTSPPath=/home/testuser/workspace/RTSP-server
[ -d $RTSPPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $RTSPPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
vmFile=$RTSPPath/releases/$floder/vm.args
[ -z $1 ] || vmFile=$RTSPPath/etc/vm.args
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/-name.*/-name RTSP-S@$LOCALHOST_IP/g" $vmFile