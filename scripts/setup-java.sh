#!/bin/bash

function setupJava {
	ln -s /usr/lib/jvm/java-8-openjdk-amd64 /usr/local/java
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

function installJava {
	add-apt-repository -y ppa:openjdk-r/ppa
	apt-get update
	apt-get install -y openjdk-8-jdk
}

echo "setup java"
installJava
setupJava
setupEnvVars