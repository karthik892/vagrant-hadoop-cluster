echo "MYSQL: Starting"
set -x
echo "MYSQL: Installing via apt-get"
echo "mysql-server-5.5 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get update

apt-get install -y mysql-server
## /sbin/service mysqld start

mysql -u root -proot -e "create user 'hiveuser'@'%' identified by 'hive'"
mysql -u root -proot -e "GRANT ALL ON *.* TO 'hiveuser'@'%'"
cp -f /vagrant/resources/hive/mysql/mysql-connector-java-8.0.30.jar /usr/local/hive/lib
cp -f /vagrant/resources/hive/mysql/mysql-connector-java-8.0.30.jar /usr/local/spark/jars
/usr/local/hive/bin/schematool -dbType mysql -initSchema