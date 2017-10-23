#!/bin/bash
username=ubuntu
password=Password@1234
############change username from default username ############
sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username
############Enable password authentication############
echo -e "$password\n$password" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart