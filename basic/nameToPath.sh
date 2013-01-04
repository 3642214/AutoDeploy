#!/bin/bash
[ -n "$1" ] || { echo "nameToPath parameter error:no parameter";exit -5; }
		case "$1" in
			ZK|zk)echo zookeeper-3.*;;
			CN|cn)echo skyFs-controller;;
			SN|sn)echo skyFs-storage;;
			CLT|clt)echo skyFS-mapreduce;;
			KV)echo KV;;
			shell)echo shell;;
			*)echo "nameToPath parameter error";exit -6;;
		esac		