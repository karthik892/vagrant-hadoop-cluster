#!/bin/bash

echo "CONDA: Starting"
echo "CONDA: Installing Anaconda"
/vagrant/resources/software/Anaconda3-2023.09-0-Linux-x86_64.sh -b

echo "CONDA: Creating environment"
export CONDA_HOME=~/anaconda3
source $CONDA_HOME/bin/activate
conda create -y -q --name hadoop python=3.8.10
conda activate hadoop
conda install -y -q pyspark geopandas jupyter
pip install apache-sedona keplergl pydeck

echo "CONDA: Generating Startup Scripts"
sudo echo export CONDA_HOME=~/anaconda3 >> /etc/profile.d/conda.sh
sudo echo source \$CONDA_HOME/bin/activate >> /etc/profile.d/conda.sh
sudo echo conda activate hadoop >> /etc/profile.d/conda.sh

echo "CONDA: Setting up jupyter notebooks"
jupyter notebook --generate-config
cp /vagrant/resources/jupyter/jupyter_notebook_config.py /home/vagrant/.jupyter/jupyter_notebook_config.py
ln -s /vagrant/ipynb ~/ipynb