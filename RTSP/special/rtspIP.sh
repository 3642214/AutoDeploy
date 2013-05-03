#!/bin/bash
RTSPPath=/home/testuser/workspace/RTSP-server
[ -d $RTSPPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $RTSPPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$RTSPPath/releases/$floder/sys.config
[ -z $1 ] || appFile=$RTSPPath/etc/app.config
[ -f $vmFile ] || { echo "$vmFile can not Found";exit 191; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/{rtsp_ip,.*},/{rtsp_ip,\"$LOCALHOST_IP\"},/g" $appFile