printf "*** Installing MySQL database server ***\n"
printf " 1. Setting mysql root password to zever01..."
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password zever01"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password zever01"
printf " Done\n"
printf " 2. Install mysql client and server..."
sudo apt-get install -y mysql-client mysql-server libmysqlclient-dev > /dev/null
printf " Done\n"
printf " 3. Set bind address to 0.0.0.0..."
sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
printf " Done\n"
printf " 4. Give root user access to all databases..."
mysql -u root -pzever01 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'zever01' WITH GRANT OPTION; FLUSH PRIVILEGES;"
printf " Done\n"

printf " 5. Restarting mysql..."
sudo service mysql restart
printf " Done\n"

MYSQL_BIND=`cat /etc/mysql/my.cnf | grep bind-address`
printf "Mysql bound to addres ${MYSQL_BIND}\n"

printf " 5. create cocoondb database with user 'cocoondb'..."
mysql -u root -pzever01 -e "create database cocoondb; GRANT ALL PRIVILEGES ON cocoondb.* TO cocoondb@localhost IDENTIFIED BY 'zever01'"
printf " Done\n"