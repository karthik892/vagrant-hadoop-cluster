apt-get install -y python3-pip
pip install apache-sedona
cp /vagrant/resources/software/apache-sedona-1.2.1-incubating-bin/sedona-python-adapter-3.0_2.12-1.2.1-incubating.jar $SPARK_HOME/jars
cp /vagrant/resources/software/apache-sedona-1.2.1-incubating-bin/sedona-core-3.0_2.12-1.2.1-incubating.jar $SPARK_HOME/jars
cp /vagrant/resources/software/apache-sedona-1.2.1-incubating-bin/sedona-viz-3.0_2.12-1.2.1-incubating.jar $SPARK_HOME/jars
cp /vagrant/resources/software/geotools-wrapper-1.1.0-25.2.jar $SPARK_HOME/jars