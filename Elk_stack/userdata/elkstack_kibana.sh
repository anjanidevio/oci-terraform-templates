#!/bin/bash
#Date - 16102017
#Developer - Sysgain

DATE=`date +%Y%m%d%T`

HOSTIP=`hostname -i`

# Configure Repos for Java, Elasticsearch, Kibana Packages
echo "---Configure Repos for Java, Elasticsearch, Kibana Packages---"   
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list 

# Enable silent installation
echo "---Enable silent installation---" 
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Repository Updates
echo "---Repository Updates---" 
sudo apt-get update
sudo apt install -y openjdk-8-jre-headless


#Installing Packages for ELK Stack
echo "---Installing Packages for ELK Stack---"  
sudo apt-get -y install nginx logstash 

#Configuring Elasticsearch
echo "---Configuring Elasticsearch---" 
sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.2.deb
sudo dpkg -i elasticsearch-5.6.2.deb
sudo sed -i 's/#network.host: 192.168.0.1/ network.host: 0.0.0.0/g' /etc/elasticsearch/elasticsearch.yml 
sudo systemctl restart elasticsearch 
sudo systemctl daemon-reload 
sudo systemctl enable elasticsearch 

#Configuring Kibana
echo "---Configuring Kibana---" 
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-5.6.2-amd64.deb
sudo dpkg -i kibana-5.6.2-amd64.deb
sudo sed -i 's/#server.host: "localhost"/ server.host: "localhost"/g' /etc/kibana/kibana.yml
sudo systemctl daemon-reload
sudo systemctl enable kibana 
sudo systemctl start kibana 

#Configuring Nginx
echo "---Configuring Nginx---" 
sudo sudo -v 
echo "adminuser:`openssl passwd -apr1 'Password@1234'`" | sudo tee -a /etc/nginx/htpasswd.users 
sudo rm /etc/nginx/sites-available/default
sudo wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/default -O /etc/nginx/sites-available/default        
sudo sed -i 's/example.com/localhost:5601/g' /etc/nginx/sites-available/default
sudo nginx -t 
sudo systemctl restart nginx 
sudo ufw allow 'Nginx Full' 

#Generate SSL Certificates
echo "---Generate SSL Certificates---" 
sudo mkdir -p /etc/pki/tls/certs 
sudo mkdir /etc/pki/tls/private 
sudo sed -i "/\[ v3_ca \]/a subjectAltName = IP: $HOSTIP" /etc/ssl/openssl.cnf
cd /etc/pki/tls >> $LOG
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt 

#Configuring Logstash
echo "---Configuring Logstash---" 
sudo wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/02-beats-input.conf -O /etc/logstash/conf.d/02-beats-input.conf 
sudo ufw allow 5044 >> $LOG
sudo wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/10-syslog-filter.conf -O /etc/logstash/conf.d/10-syslog-filter.conf 
sudo wget https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-elk-stack/Elk_stack/scripts/30-elasticsearch-output.conf -O /etc/logstash/conf.d/30-elasticsearch-output.conf 
sudo /opt/logstash/bin/logstash --configtest -f /etc/logstash/conf.d/ 
sudo systemctl restart logstash 
sudo systemctl enable logstash 

#Configuring Kibana Dashboards
echo "---Configuring Kibana Dashboards---" 
cd ~
sudo curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.2.2.zip
sudo apt-get install unzip 
sudo unzip beats-dashboards-*.zip 
cd beats-dashboards-* 
./load.sh 

#Load Filebeat Index Template in Elasticsearch
echo "---Load Filebeat Index Template in Elasticsearch---" 
sudo curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json 
sudo curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@filebeat-index-template.json 
cd /etc/pki/tls/certs/

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
exit 0
