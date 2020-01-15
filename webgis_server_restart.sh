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
	echo "执行命令: ps aux | grep -v grep | grep $webgis_server_container_type | grep $webgis_server_path | awk '{print \$2}' | xargs kill -9"
	ps aux | grep -v grep | grep $webgis_server_container_type | grep $webgis_server_path | awk '{print $2}' | xargs kill -9
	echo '===== 重启WebGis服务器 ====='
	if [[ $webgis_server_container_type == "tomcat" ]]; then
		bash $webgis_server_path/bin/startup.sh
		echo "执行命令: bash $webgis_server_path/bin/startup.sh"
	elif [[ $webgis_server_container_type == "jetty" ]]; then
		echo "执行命令: bash $webgis_server_path/bin/jetty.sh restart"
		bash $webgis_server_path/bin/jetty.sh restart
	else
		echo '服务器类型类型未知! 请检查 webgis_server_container_type 配置项!'
	fi
}


# main
echo '============================='
echo '调用webgis_server_restart脚本'
echo '============================='
webgis_server_restart
