#!/bin/bash
[ -n "$1" ] || { echo "nameToPath parameter error";exit -1; }
		case "$1" in
			ZK|zk)echo zookeeper-3.*;;
			CN|cn)echo skyFs-controller;;
			SN|sn)echo skyFs-storage;;
			CLT|clt)echo skyFS-mapreduce;;
			*)echo "run parameter error";;
		esac		