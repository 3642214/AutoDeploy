#!/bin/bash
vmFile=/home/testuser/workspace/skyFs-storage/etc/vm.args
[ -f $vmFile ] || echo "$vmFile can not Found";exit -1
	LOCALHOST_IP="$(ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}')"
	sed -i "s/-name.*/-name SN@$LOCALHOST_IP/g" $vmFile