#!/bin/bash

NODE=3

echo "ZOOKEEPER ID: Setting up zookeeper id"

while getopts s:t: option
do
	case "${option}"
	in
		s) NODE=${OPTARG};;
	esac
done

echo "ZOOKEEPER ID: Modifying $HADOOP_CONF_DIR/workers"

entry="$NODE"
echo "adding ${entry}"
echo "${entry}" >> /var/zookeeper/data/myid

echo "ZOOKEEPER ID: Task Completed Successfully"
