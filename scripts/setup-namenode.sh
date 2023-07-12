#!/bin/bash

echo "NAMENODE SETUP: Setting up known hosts"
ssh-keyscan -H node2 >> ~/.ssh/known_hosts

echo "NAMENODE SETUP: Setting up known hosts"
ssh-keyscan -H node2 >> ~/.ssh/known_hosts

echo "NAMENODE SETUP: Formatting NameNode"
$HADOOP_HOME/bin/hdfs namenode -format myhadoop

echo "NAMENODE SETUP: Starting cluster"
$HADOOP_HOME/sbin/start-all.sh
