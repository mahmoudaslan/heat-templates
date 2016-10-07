#!/bin/sh
sudo apt-get update
sudo apt-get -y install apache2
sudo a2enmod proxy_fcgi
sudo sed -i "/<VirtualHost \*:80>/a ProxyPassMatch ^\/(.\*\\\.php(\/.*)?)$ fcgi:\/\/$lb_ip:9000\/var\/www\/html\/\$1" /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

wget http://wordpress.org/latest.tar.gz -P /home/ubuntu
tar xzvf /home/ubuntu/latest.tar.gz -C /home/ubuntu
sudo rsync -avP /home/ubuntu/wordpress/ /var/www/html/

sudo mkdir /var/www/html/wp-content/uploads
sudo chown -R ubuntu:www-data /var/www/html/
sudo chmod g+w /var/www/html/wp-content/uploads
