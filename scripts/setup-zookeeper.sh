#!/bin/bash

echo "ZOOKEEPER: Starting"
echo "ZOOKEEPER: Copying Files"
tar -xzf /vagrant/resources/software/apache-zookeeper-3.8.3-bin.tar.gz -C /usr/local       # Extract hadoop archive into node
ln -s /usr/local/apache-zookeeper-3.8.3-bin /usr/local/zookeeper                       # Create symbolic link to simplify scripting

echo "ZOOKEEPER: Generating Startup scripts"
echo export ZK_HOME=/usr/local/zookeeper >> /etc/profile.d/zookeeper.sh
echo export PATH=\${ZK_HOME}/bin:\${PATH} >> /etc/profile.d/zookeeper.sh
echo export CLASSPATH=\$CLASSPATH:/usr/local/zookeeper/lib/jetty-server-9.4.52.v20230823.jar >> /etc/profile.d/zookeeper.sh

echo "ZOOKEEPER: Copying configuration files"
cp -f /vagrant/resources/zookeeper/config/* /usr/local/zookeeper/conf

echo "ZOOKEEPER: Creating working directories"
mkdir /var/zookeeper
mkdir /usr/local/zookeeper/logs
mkdir /var/zookeeper/data
echo "1" >> /usr/local/zookeeper/data/myid

chown -R vagrant /var/zookeeper
chown -R vagrant /usr/local/zookeeper/logs

echo "ZOOKEEPER: Task completed successfully"