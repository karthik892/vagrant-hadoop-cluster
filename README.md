# Vagrant Hadoop Cluster
## Preface/ Why does this project exist?
I recently found myself in a position where I had to conduct some experiments with big data and hadoop technologies such as MapReduce, Spark and HBase. Unfortunatelely, while all these technologies are free and open source, the process for getting things up and running is slow and cumbersome. Between poor documentation, non-standardized installation proce4sses and incompatibilities between versions, it's easy to ignore hadoop's potential.

Here are a few alternative solutions that I have considered (they might work for you!):
- Bitnami Hadoop
- Cloudera Data Platform (formerly, HortonWorks Data Platform)

This project is based on a number of projects on GitHub that do similar things, such as:
- https://github.com/ssalat/vagrant-hadoop-cluster
- https://github.com/martinprobson/vagrant-hadoop-hive-spark


Unfortunately, these projects are all very old and require quite a bit of work to get them to work with the latest versions of Hadoop.

## Introduction/ What does this project do?
This project contains scripts that will do the following:
- Set up a cluster of VM's that will be networked together
- Install an LTS version of Ubuntu Server edition
- Install and configure Hadoop
- Install and configure additional big data tools built on Hadoop such as Spark, Hive and HBase

## Prerequisites
You will need the following applications to use set up the virtual cluster:
- Vagrant (tested with version 2.3.6)
- VirtualBox (tested with version 7.0.8)
## Installation Instructions
### STEP 1: Configure the number of nodes
Open ```Vagrantfile``` and change the number of nodes in line 7, you must have a minumum of 2 nodes (one namenode and one datanode)

### STEP 2: Configure hosts file
To make it easy to access the nodes of your virtual cluster, it is recommended that you update your hosts file.

In windows, this file can be found in: ```c:\Windows\System32\Drivers\etc\hosts```
Simply add the following lines to the end of the file:
```
10.211.55.101 node1
10.211.55.102 node2
10.211.55.103 node3
10.211.55.104 node4
10.211.55.105 node5
```
You can add further to this if you have more than 5 nodes.
Now we can open a browser and type ```http://node1:9870``` instead of ```http://10.211.55.101:9870``` to access the NameNode

### STEP 3: Create SSH keys
For nodes in a hadoop cluster to communicate with each other, they must all have the same SSH keys installed. Before these keys can be installed, we need to generate them on our host machine.

Go to the root directiory of the project (the folder with this readme) and run the following command
```
ssh-keygen -f "resources/ssh/id_rsa"
```
NOTE: do not use a passphrase

### STEP 4: Download Software
We need to download all the archives that will have to be installed in our nodes.
In future, I will integrate this into the Vagrantfile. For now, you will need to run ```download-software.bat``` on a windows machine

### STEP 5: Start vagrant
Open a terminal window in the root directory of this project and run:
```
vagrant up
```

## Application-specific notes

### Hadoop

#### Configuration Files
All configuration files are stores in ```$HADOOP_HOME/etc/hadoop```

#### Default Web UI addresses

- http://node1:9870 - Name Node
- http://node1:8088 - Resource Manager (YARN)
- http://node2:8042, http://node3:8042, http://node4:8042, http://node5:8042 - Node Manager

Sources:
https://kontext.tech/article/265/default-ports-used-by-hadoop-services-hdfs-mapreduce-yarn

#### Log File Locations
Hadoop log files are stored in $HADOOP_HOME/logs

- hadoop-root-resourcemanager-node1.log  
- hadoop-root-resourcemanager-node1.out  
- hadoop-vagrant-namenode-node1.log     
- hadoop-vagrant-namenode-node1.out     
- hadoop-vagrant-proxyserver-node1.log  
- hadoop-vagrant-proxyserver-node1.out
- hadoop-vagrant-secondarynamenode-node1.log
- hadoop-vagrant-secondarynamenode-node1.out
- SecurityAuth-vagrant.audit           

### Zookeeper

#### Configuration Files
All configuration files are stores in ```/usr/local/zookeeper/conf```

#### Default Web UI Addresses

- http://node1:8180/commands

#### Log file locations

Logs can be viewed with ```journalctl```

### Storm

#### Configuration Files
All configuration files are stores in ```/usr/local/storm/conf```

#### Default Web UI Addresses

- http://node1:8090/ - Storm UI
- http://node1:8000/api/v1/daemonlog?file=nimbus.log - Log Viewer

#### Log file locations

Logs can be viewed with ```journalctl```

Additional log files are stored in ```$STORM_HOME/logs```

- access-logviewer.log
- access-nimbus.log
- access-supervisor.log
- access-ui.log
- access-web-logviewer.log
- access-web-nimbus.log
- access-web-supervisor.log
- access-web-ui.log
- logviewer.log
- logviewer.log.metrics
- nimbus.log
- nimbus.log.metrics
- supervisor.log
- supervisor.log.metrics
- ui.log
- ui.log.metrics

### Hive

#### Configuration Files
All configuration files are stores in ```$HIVE_HOME/conf```

#### Default Web UI Addresses

- http://node1:10002/

### Spark

#### Configuration Files
All configuration files are stores in ```$SPARK_HOME/conf```

#### Default Web UI Addresses

- http://node1:8080/ - Spark Master
- http://node1:8081/ - Spark Worker
- http://node1:4040/ - Spark Jobs (only available when a job is in progress)

#### Log file locations

Spark log files are stored in ```$SPARK_HOME/logs```

- spark-vagrant-org.apache.spark.deploy.history.HistoryServer-1-node1.out
- spark-vagrant-org.apache.spark.deploy.master.Master-1-node1.out
- spark-vagrant-org.apache.spark.deploy.worker.Worker-1-node1.out
- spark-vagrant-org.apache.spark.sql.hive.thriftserver.HiveThriftServer2-1-node1.out

## Verifying that everything is running
### JPS

The easiest way to verify that things are working correctly is with JPS, simply run the command ```jps -mlV```.

On the name node you should see the following:
- org.apache.hadoop.hdfs.server.namenode.NameNode - Hadoop Namenode
- org.apache.hadoop.yarn.server.resourcemanager.ResourceManager - Hadoop Resource Manager
- org.apache.zookeeper.server.quorum.QuorumPeerMain - Zookeeper
- org.apache.spark.deploy.worker.Worker - Spark Worker
- org.apache.spark.deploy.history.HistoryServer - Spark History Server

On data nodes, you should see the following:
- org.apache.hadoop.hdfs.server.datanode.DataNode - Hadoop Datanode
- org.apache.hadoop.yarn.server.nodemanager.NodeManager - Hadoop Node Manager
- org.apache.zookeeper.server.quorum.QuorumPeerMain - Zookeeper

## Known Issues

- Hadoop has not been properly set up to use zookeeper
- Apache Hive is not compatible with Java 11 - https://github.com/exasol/hadoop-etl-udfs/issues/59