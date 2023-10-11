#!/bin/bash

rm -r /vagrant/logs/*
mkdir /vagrant/logs/hadoop
cp $HADOOP_HOME/logs/* /vagrant/logs/hadoop
mkdir /vagrant/logs/spark
cp $SPARK_HOME/logs/* /vagrant/logs/spark
mkdir /vagrant/logs/zk
cp $ZK_HOME/logs/* /vagrant/logs/zk
mkdir /vagrant/logs/hbase
cp $HBASE_HOME/logs/* /vagrant/logs/hbase
