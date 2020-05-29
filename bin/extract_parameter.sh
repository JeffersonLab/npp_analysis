#!/bin/bash
config_file=$1
parameter_name=$2
parameter_default_value=$3
if grep -q $parameter_name $config_file
    then
    grep $parameter_name $config_file | awk -F= '{print $2}'
else
    if [ ! -z "$parameter_default_value" ]
	then
	echo $parameter_default_value
    else
	echo "no value found for parameter $parameter_name"
	exit 1
    fi
fi
