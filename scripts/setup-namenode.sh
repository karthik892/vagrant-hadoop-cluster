#!/bin/bash

echo "NAMENODE HADOOP: Formatting NameNode"
$HADOOP_HOME/bin/hdfs namenode -format myhadoop

echo "NAMENODE HADOOP: Setting up known hosts"
#ssh-keyscan -H node2 >> ~/.ssh/known_hosts

echo "ANACONDA-PYSPARK: Generating startup scripts"
#echo source ~/anaconda3/bin/activate >> /etc/profile.d/anaconda.sh

echo "NAMENODE: Starting ZooKeeper Server"
#$ZK_HOME/bin/zkServer.sh start

echo "NAMENODE THRIFT: Starting HiveServer2 ThriftServer"
#start-thriftserver.sh --hiveconf hive.server2.thrift.port=10000

echo "NAMENODE HBASE: Starting HBase"
#$HBASE_HOME/bin/start-hbase.sh

# echo "ANACONDA-PYSPARK: Generating Startup scripts"
# sudo echo export ANACONDA_HOME=~/anaconda3 >> /etc/profile.d/anaconda.sh
# sudo echo source $ANACONDA_HOME/bin/activate >> /etc/profile.d/anaconda.sh
# sudo echo conda activate hadoop >> /etc/profile.d/anaconda.sh

#echo "ANACONDA-PYSPARK: Setting Jupyter config"
#cp /vagrant/resources/jupyter ~/.jupyter/jupyter_notebook_config.py

echo "Dumping startup logs"
#/vagrant/bin/dumplogs.sh