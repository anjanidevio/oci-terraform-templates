#!/bin/bash
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirror.jmu.edu/pub/mariadb/repo/10.1/ubuntu xenial main'
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y mariadb-server

#install wordpress
cd /tmp/ && wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
sudo cp -R wordpress/* /var/www/html
sudo rm -rf /var/www/html/index.html
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
