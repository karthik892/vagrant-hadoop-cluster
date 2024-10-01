#!/bin/bash

echo "NAMENODE SERVICES - HADOOP"
cp /vagrant/resources/hadoop/systemd/hadoop.service /etc/systemd/system/hadoop.service
systemctl enable hadoop.service
systemctl start hadoop.service

echo "NAMENODE SERVICES - SPARK"
cp /vagrant/resources/spark/systemd/spark.service /etc/systemd/system/spark.service
systemctl enable spark.service
systemctl start spark.service

echo "NAMENODE SERVICES - SPARK-HISTORY-SERVER"
cp /vagrant/resources/spark/systemd/spark-history-server.service /etc/systemd/system/spark-history-server.service
systemctl enable spark-history-server.service
systemctl start spark-history-server.service

echo "NAMENODE SERVICES - ZOOKEEPER"
cp /vagrant/resources/zookeeper/systemd/zookeeper.service /etc/systemd/system/zookeeper.service
systemctl enable zookeeper.service
systemctl start zookeeper.service

echo "NAMENODE SERVICES - HIVE"
cp /vagrant/resources/hive/systemd/hive.service /etc/systemd/system/hive.service
systemctl enable hive.service
systemctl start hive.service
