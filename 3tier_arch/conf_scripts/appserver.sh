#!/bin/sh
sudo apt-get update
sudo apt-get -y install mysql-client
sudo apt-get -y install php
sudo apt-get -y install php-mysql
sudo apt-get -y install php7.0-xml
sudo sed -i "s/listen = .*/listen = 0.0.0.0:9000/g" /etc/php/7.0/fpm/pool.d/www.conf
sudo service php7.0-fpm restart

wget http://wordpress.org/latest.tar.gz -P /home/ubuntu
tar xzvf /home/ubuntu/latest.tar.gz -C /home/ubuntu

cp /home/ubuntu/wordpress/wp-config-sample.php /home/ubuntu/wordpress/wp-config.php
sed -i "s/database_name_here/$db_name/g" /home/ubuntu/wordpress/wp-config.php
sed -i "s/username_here/$db_user/g" /home/ubuntu/wordpress/wp-config.php
sed -i "s/password_here/$db_pass/g" /home/ubuntu/wordpress/wp-config.php
sed -i "s/localhost/$db_host/g" /home/ubuntu/wordpress/wp-config.php
sudo mkdir -p /var/www/html
sudo rsync -avP /home/ubuntu/wordpress/ /var/www/html/

sudo mkdir /var/www/html/wp-content/uploads
sudo chown -R ubuntu:www-data /var/www/html/
sudo chmod g+w /var/www/html/wp-content/uploads
sudo cp /var/www/html/index.php /var/www/html/index2.php
