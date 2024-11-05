#!/bin/bash

echo "STORM: Starting"
echo "STORM: Copying Files"

tar -xzf /vagrant/resources/software/apache-storm-2.6.4.tar.gz -C /usr/local
ln -s /usr/local/apache-storm-2.6.4/ /usr/local/storm


echo "STORM: Generating Startup scripts"
echo export STORM_HOME=/usr/local/storm >> /etc/profile.d/storm.sh
echo export PATH=\${STORM_HOME}/bin:\${PATH} >> /etc/profile.d/storm.sh

echo "STORM: Copying Configuration Files"
cp -f /vagrant/resources/storm/conf/* /usr/local/storm/conf

echo "STORM: Creating working directories"
mkdir /usr/local/storm/logs
mkdir /usr/local/apache-storm-2.6.4/storm-local/supervisor

chown vagrant /usr/local/storm/logs
chown vagrant /usr/local/apache-storm-2.6.4

echo "STORM: Task Completed Successfully"