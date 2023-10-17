#!/bin/bash

echo "ANACONDA-PYSPARK: Starting"
echo "ANACONDA-PYSPARK: Installing Anaconda"
/vagrant/resources/software/Anaconda3-2023.09-0-Linux-x86_64.sh -b

echo "ANACONDA-PYSPARK: Creating environment"
export ANACONDA_HOME=~/anaconda3
source $ANACONDA_HOME/bin/activate
conda create -y -q --name hadoop python=3.8.10
conda activate hadoop
conda install -y -q pyspark geopandas jupyter
pip install apache-sedona keplergl pydeck