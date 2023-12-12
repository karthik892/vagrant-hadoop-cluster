#!/bin/bash

echo "DATANODE SERVICES - ZOOKEEPER"
cp /vagrant/resources/zookeeper/systemd/zookeeper.service /etc/systemd/system/zookeeper.service
systemctl enable zookeeper.service
systemctl start zookeeper.service

