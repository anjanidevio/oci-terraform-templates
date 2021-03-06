#!/bin/bash
username=$1
pwd=$2
############change username from default username ############
sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username
############Enable password authentication############
echo -e "$pwd\n$pwd" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
service sshd restart
