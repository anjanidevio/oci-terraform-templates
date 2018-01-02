#!/bin/bash
username=ubuntu
pwd=Password@1234
sudo usermod -l $username ubuntu
usermod -d /home/$username -m $username
echo -e "$pwd\n$pwd" | sudo passwd $username
sudo apt-get -y install whois
sudo useradd -p `mkpasswd "Password@123"` -d /home/puppet -m -g users -s /bin/bash puppet
echo -e "puppet ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
file="/etc/ssh/sshd_config"
passwd_auth="yes"
cat $file \
| sed -e "s:\(PasswordAuthentication\).*:PasswordAuthentication $passwd_auth:" \
> $file.new
mv $file.new $file
service sshd restart