# Vagrant Hadoop Cluster
## Preface/ Why does this project exist?
I recently found myself in a position where I had to conduct some experiments with big data and hadoop technologies such as MapReduce, Spark and HBase. Unfortunatelely, while all these technologies are free and open source, the process for getting things up and running is slow and cumbersome. Between poor documentation, non-standardized installation proce4sses and incompatibilities between versions, it's easy to ignore hadoop's potential.

Here are a few alternative solutions that I have considered (they might work for you!):
- Bitnami Hadoop
- Cloudera Data Platform (formerly, HortonWorks Data Platform)

This project is based on a number of projects on GitHub that do similar things, such as:
- https://github.com/ssalat/vagrant-hadoop-cluster

Unfortunately, these projects are all very old and require quite a bit of work to get them to work with the latest versions of Hadoop.

## Introduction/ What does this project do?
This project contains scripts that will do the following:
- Set up a cluster of VM's that will be networked together
- Install an LTS version of Ubuntu Server edition
- Install and configure Hadoop
- Install and configure additional big data tools built on Hadoop such as Spark, Hive and HBase

## Installation Instructions
TBA

