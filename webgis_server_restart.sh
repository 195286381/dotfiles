#!/bin/bash
#####################
## variable define ##
#####################
webgis_server_container_type=jetty # tomcat|jetty
webgis_server_path=/data2/zzw/jetty/jetty-distribution-9.4.19.v20190610/


#####################
## function define ##
#####################

# 重启webgis服务.
function webgis_server_restart() {
	echo '===== 关闭WebGis服务器 ====='
	echo "ps aux | grep -v grep | grep $webgis_server_container_type | grep $webgis_server_path | awk '{print $2}' | xargs kill -9"
	ps aux | grep -v grep | grep $server_container_type | grep $webgis_server_path | awk '{print $2}' | xargs kill -9
	echo '===== 重启WebGis服务器 ====='
	if [[ $webgis_server_container_type == "tomcat" ]]; then
		bash $webgis_server_path/bin/startup.sh
	elif [[ $webgis_server_container_type == "jetty" ]]; then
		bash $webgis_server_path/bin/jetty.sh restart
	else
		echo '$webgis_server_container_type 类型未知!, 重启服务器失败'
	fi
}


# main
echo '调用webgis_server_restart脚本!'
webgis_server_restart
