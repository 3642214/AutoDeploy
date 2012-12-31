#!/bin/bash
. conf_path
rm -fr /home/testuser/tmp
/bin/mkdir -p $tmpPath
/bin/cp -r $logPath/*.log* $tmpPath/
[ $? = "0" ] || echo "cp fail"
 	/usr/bin/scp -r $tmpPath root@192.168.8.209:/mnt/sda/log/
	[ $? = "0" ] || echo "upload fail"
  	rm -fr /home/testuser/tmp