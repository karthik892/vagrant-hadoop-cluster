#!/bin/bash

echo "NAMENODE SETUP: Setting up known hosts"
ssh-keyscan -H node2 >> ~/.ssh/known_hosts

echo "NAMENODE SETUP: Setting up known hosts"
ssh-keyscan -H node2 >> ~/.ssh/known_hosts

echo "NAMENODE SETUP: Formatting NameNode"
$HADOOP_HOME/bin/hdfs namenode -format myhadoop

echo "NAMENODE: Starting ZooKeeper Server"
$ZK_HOME/bin/zkServer.sh start

echo "NAMENODE SETUP: Starting hadoop cluster"
$HADOOP_HOME/sbin/start-all.sh

echo "NAMENODE SPARK: Starting spark and history server"
$SPARK_HOME/sbin/start-all.sh
mkdir /tmp/spark-events
$SPARK_HOME/sbin/start-history-server.sh

echo "NAMENODE THRIFT: Starting HiveServer2 ThriftServer"
start-thriftserver.sh --hiveconf hive.server2.thrift.port=10000

echo "NAMENODE HBASE: Starting HBase"
$HBASE_HOME/bin/start-hbase.sh
