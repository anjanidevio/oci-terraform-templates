#!/bin/bash
username="mariadb"
pwd=mariadb@123
sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username
echo -e "$pwd\n$pwd" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart

sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install -y software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://ftp.kaist.ac.kr/mariadb/repo/5.5/ubuntu precise main'
sudo apt-get install -y mariadb-client
sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-pear php-imagick php-imap php-mcrypt php-recode php-tidy php-xmlrpc -y
sudo systemctl restart apache2
sudo apt-get install firewalld -y
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=22/tcp --permanent
sudo firewall-cmd --reload
