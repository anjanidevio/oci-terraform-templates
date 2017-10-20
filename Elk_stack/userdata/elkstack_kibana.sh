#!/bin/bash
#Date - 16102017
#Developer - Sysgain

DATE=`date +%Y%m%d%T`
LOG=/tmp/elkstack_deploy.log.$DATE
HOSTIP=`hostname -i`

# Configure Repos for Java, Elasticsearch, Kibana Packages
echo "---Configure Repos for Java, Elasticsearch, Kibana Packages---"   >> $LOG
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - >> $LOG

# Enable silent installation
echo "---Enable silent installation---" >> $LOG
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Repository Updates
echo "---Repository Updates---" >> $LOG
sudo apt-get update
sudo apt install -y openjdk-8-jre-headless


#Installing Packages for ELK Stack
echo "---Installing Packages for ELK Stack---"  >> $LOG
sudo apt-get -y install nginx  >> $LOG

#Configuring Elasticsearch
echo "---Configuring Elasticsearch---" >> $LOG
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.2.deb
sudo dpkg -i elasticsearch-5.6.2.deb
sudo sed -i 's/#network.host: 192.168.0.1/ network.host: localhost/g' /etc/elasticsearch/elasticsearch.yml >> $LOG
sudo systemctl restart elasticsearch >> $LOG
sudo systemctl daemon-reload >> $LOG
sudo systemctl enable elasticsearch >> $LOG

#Configuring Kibana
echo "---Configuring Kibana---" >> $LOG
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-5.6.2-amd64.deb
sudo dpkg -i kibana-5.6.2-amd64.deb
sudo sed -i 's/#server.host: "localhost"/ server.host: "localhost"/g' /etc/kibana/kibana.yml
sudo systemctl daemon-reload >> $LOG
sudo systemctl enable kibana >> $LOG
sudo systemctl start kibana >> $LOG

#Configuring Nginx
echo "---Configuring Nginx---" >> $LOG
sudo sudo -v >> $LOG
echo "adminuser:`openssl passwd -apr1 'Password@1234'`" | sudo tee -a /etc/nginx/htpasswd.users >> $LOG
sudo rm /etc/nginx/sites-available/default
sudo wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/default -O /etc/nginx/sites-available/default
sudo sed -i 's/example.com/localhost:5601/g' /etc/nginx/sites-available/default
sudo nginx -t >> $LOG
sudo systemctl restart nginx >> $LOG
sudo ufw allow 'Nginx Full' >> $LOG

#Generate SSL Certificates
echo "---Generate SSL Certificates---" >> $LOG
sudo mkdir -p /etc/pki/tls/certs >> $LOG
sudo mkdir /etc/pki/tls/private >> $LOG
sudo sed -i "/\[ v3_ca \]/a subjectAltName = IP: $HOSTIP" /etc/ssl/openssl.cnf >> $LOG
cd /etc/pki/tls >> $LOG
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt >> $LOG

#Configuring Kibana Dashboards
echo "---Configuring Kibana Dashboards---" >> $LOG
cd ~
sudo curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.2.2.zip >> $LOG
sudo apt-get install unzip >> $LOG
sudo unzip beats-dashboards-*.zip >> $LOG
cd beats-dashboards-* >> $LOG
./load.sh >> $LOG

sudo apt-get update
sudo apt-get install firewalld -y
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=5044/tcp --permanent
sudo firewall-cmd --zone=public --add-port=5601/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9200/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo service elasticsearch start
sudo service kibana start
sudo service nginx start
