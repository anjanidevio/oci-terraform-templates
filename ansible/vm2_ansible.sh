#!/bin/bash
echo "******** python installation *********"
sudo apt-get update
sudo apt-get install software-properties-common python-software-properties -y
sudo apt-get update
sudo apt-get install python
echo "******** python installed *************"
echo "********python version*****************"
python --version
