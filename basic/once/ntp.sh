#!/bin/bash
ntpShell=/usr/sbin/ntpdate 192.168.8.213 && hwclock -w >/dev/null 2>&1
count=`grep $ntpShell /var/spool/cron/root|wc -l`
[ $count > 0 ] || echo $ntpShell >> /var/spool/cron/root