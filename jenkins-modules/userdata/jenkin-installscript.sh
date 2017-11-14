#!/bin/bash
sudo apt-get update
sudo apt install -y firewalld
sudo firewall-cmd --list-ports
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanant
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload

#for installing hxselect#
#sudo apt-get update
#sudo apt install html-xml-utils
#sleep 20

#installing jenkins#
sudo apt-get update
sudo apt-get install -y default-jre 
sudo apt-get install -y default-jdk
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins
sudo service jenkins restart

