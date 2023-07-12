#!/bin/bash

START=3
TOTAL_NODES=2

echo "HADOOP WORKERS: Setting up workers file"

while getopts s:t: option
do
	case "${option}"
	in
		s) START=${OPTARG};;
		t) TOTAL_NODES=${OPTARG};;
	esac
done

echo "HADOOP WORKERS: Modifying $HADOOP_CONF_DIR/workers"
for i in $(seq $START $TOTAL_NODES)
do 
	entry="node${i}"
	echo "adding ${entry}"
	echo "${entry}" >> $HADOOP_CONF_DIR/workers
done
echo "HADOOP WORKERS: Task Completed Successfully"
