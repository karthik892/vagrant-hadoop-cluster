#!/bin/bash

rm -r /vagrant/logs/*

mkdir /vagrant/logs/hadoop
cp $HADOOP_HOME/logs/* /vagrant/logs/hadoop
journalctl -u hadoop.service >> /vagrant/logs/hadoop/systemd.log

mkdir /vagrant/logs/spark
cp $SPARK_HOME/logs/* /vagrant/logs/spark
journalctl -u spark.service >> /vagrant/logs/spark/systemd.log
journalctl -u spark-history-server.service >> /vagrant/logs/spark/systemd-historyserver.log

#mkdir /vagrant/logs/zk
#cp $ZK_HOME/logs/* /vagrant/logs/zk
#journalctl -u zookeeper.service >> /vagrant/logs/zookeeper/systemd.log

mkdir /vagrant/logs/hive
journalctl -u hive.service >> /vagrant/logs/hive/systemd.log

# mkdir /vagrant/logs/hbase
# cp $HBASE_HOME/logs/* /vagrant/logs/hbase
# journalctl -u hbase.service >> /vagrant/logs/hbase/systemd.log
