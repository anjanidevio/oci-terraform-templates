#!/bin/bash
echo "********ansible installation *********"
sudo apt-get update
sudo apt-get install software-properties-common 
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y
echo "********* ansible installed************"
echo "********* ansible version**************"
ansible --version
exit
