#!/bin/bash
export LC_ALL=C
CPU_NUMBER=$(lscpu|grep "^CPU(s):"|awk '{print $2}')

if [ -d /sys/devices/platform/fb000000.gpu* ];then
	GPU_EXIST="YES"
else
	GPU_EXIST="NO"
fi

if [ -d /sys/devices/platform/fdc38100.rkvdec* ];then
	RKVDEC1_EXIST="YES"
else
	RKVDEC1_EXIST="NO"
fi

if [ -d /sys/devices/platform/fdc48100.rkvdec* ];then
	RKVDEC2_EXIST="YES"
else
	RKVDEC2_EXIST="NO"
fi

if [ -d /sys/devices/platform/fdbd0000.rkvenc* ];then
	RKVENC1_EXIST="YES"
else
	RKVENC1_EXIST="NO"
fi

if [ -d /sys/devices/platform/fdbe0000.rkvenc* ];then
	RKVENC2_EXIST="YES"
else
	RKVENC2_EXIST="NO"
fi

echo CPU开核结果：${CPU_NUMBER}核
echo GPU开核结果：$GPU_EXIST
echo 解码器1开核结果：$RKVDEC1_EXIST
echo 解码器2开核结果：$RKVDEC2_EXIST
echo 编码器1开核结果：$RKVENC1_EXIST
echo 编码器2开核结果：$RKVENC2_EXIST
