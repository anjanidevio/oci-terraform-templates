#!/bin/bash
username=datasunrise
pwd=datasunrise@1234

echo -e "opc ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
echo -e "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
############change username from default username ############
sudo usermod -l $username opc
usermod -d /home/$username -m $username
############Enable password authentication############
echo -e "$pwd\n$pwd" | sudo passwd $username
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart