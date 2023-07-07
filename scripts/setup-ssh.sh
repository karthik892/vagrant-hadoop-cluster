#!/bin/bash

echo "setup ssh"

cp /vagrant/resources/ssh/id_rsa /home/vagrant/.ssh/id_rsa
cat /vagrant/resources/ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
cat /vagrant/resources/ssh/id_rsa.pub >> /root/.ssh/authorized_keys

sudo sed -E -i 's|^#?(PasswordAuthentication)\s.*|\1 no|' /etc/ssh/sshd_config
if ! grep '^PasswordAuthentication\s' /etc/ssh/sshd_config; then echo 'PasswordAuthentication no' |sudo tee -a /etc/ssh/sshd_config; fi

service ssh restart