#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "nameToPath parameter error:no parameter";exit 251; }
		case "$1" in
			ZK|zk)echo zookeeper-3.*;;
			CN|cn)echo skyFs-controller;;
			SN|sn)echo skyFs-storage;;
			RTSP|rtsp)echo RTSP-server;;
			CLT|clt|CLT_Master|CLT_Snode)echo skyFS-mapreduce;;
			SMTSDVR|smtsdvr)echo smts_dvr;;
			KV)echo KV;;
			shell)echo shell;;
			*)log "nameToPath parameter error";exit 250;;
		esac		
