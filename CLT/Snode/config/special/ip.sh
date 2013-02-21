#!/bin/bash
vmFile=/home/testuser/workspace/skyFS-mapreduce/etc/vm.args
[ -f $vmFile ] || { echo "$vmFile can not Found";exit -1; }
        LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
        sed -i "s/-name.*/-name MR-S@$LOCALHOST_IP/g" $vmFile
