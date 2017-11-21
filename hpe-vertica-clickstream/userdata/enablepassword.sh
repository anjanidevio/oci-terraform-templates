#!bin/bash
username="dbadmin"
pwd="Testdriveuser123"
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