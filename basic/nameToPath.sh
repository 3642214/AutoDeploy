#!/bin/bash
. conf_path
[ -n "$1" ] || { log "nameToPath parameter error:no parameter";exit 251; }
		case "$1" in
			ZK|zk)echo zookeeper-3.*;;
			CN|cn)echo skyFs-controller;;
			SN|sn)echo skyFs-storage;;
			CLT|clt)echo skyFS-mapreduce;;
			KV)echo KV;;
			shell)echo shell;;
			*)log "nameToPath parameter error";exit 250;;
		esac		