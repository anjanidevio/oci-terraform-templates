SHELL = /bin/bash
admin_username=$1
public_IP=$2
sudo apt-get -y update
sudo apt-get purge -y ufw
sudo apt-get install -y firewalld
sudo systemctl start firewalld
sudo service firewalld stop
sudo apt-get -y install build-essential gfortran
sudo apt-get -y install build-essential gfortran gcc-multilib g++-multilib libffi-dev libffi6 libffi6-dbg python-crypto python-mox3 python-pil python-ply libssl-dev zlib1g-dev libbz2-dev libexpat1-dev libbluetooth-dev libgdbm-dev dpkg-dev quilt autotools-dev libreadline-dev libtinfo-dev libncursesw5-dev tk-dev blt-dev libssl-dev zlib1g-dev libbz2-dev libexpat1-dev libbluetooth-dev libsqlite3-dev libgpm2 mime-support netbase net-tools bzip2
sudo apt-get -y install git curl vim tmux htop ranger
sudo apt-get -y install python2.7 python-dev python-pip
sudo apt-get -y install python-serial python-setuptools python-smbus
sudo apt install python-pip
pip install virtualenv
cd ~/
mkdir venv
pip install --upgrade pip
pushd venv
#virtualenv data-science
python -m virtualenv data-science
popd
source ~/venv/data-science/bin/activate
pip install --upgrade setuptools
pip install virtualenvwrapper
pip install cython
pip install nose
sudo apt-get -y install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
pip install jupyter
sudo apt-get -y install libfreetype6-dev libpng12-dev libjs-mathjax fonts-mathjax libgcrypt11-dev libxft-dev
pip install matplotlib
sudo apt-get -y install libatlas-base-dev gfortran
pip install Seaborn
pip install statsmodels
pip install scikit-learn
pip install numexpr && pip install bottleneck && pip install pandas && pip install SQLAlchemy && pip install pyzmq && pip install jinja2 && pip install tornado
pip install nltk
pip install gensim
sudo apt-get update && sudo apt-get -y install tmux
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install r-base
sudo apt-get -y install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.442-amd64.deb
sudo apt-get -y install gdebi
sudo gdebi -n rstudio-server-1.1.442-amd64.deb
rm rstudio-server-*
sudo rstudio-server verify-installation
jupyter notebook --generate-config
echo -e "\nc.NotebookApp.ip = '$public_IP'" >> /home/datascience/.jupyter/jupyter_notebook_config.py
#jupyter notebook

##Steps for Test Drive
sudo apt-get install -y dos2unix 
sudo mkdir /tmp/azurefiles

## Restricted Environment Setup
sudo cp /bin/bash /bin/rbash 
sudo usermod -s /bin/rbash $admin_username
sudo mkdir  -p /home/$admin_username/programs
sudo wget -O /tmp/azurefiles/bashprofile.txt https://aztdrepo.blob.core.windows.net/restrictedshell/bashprofile.txt

sudo cat /tmp/azurefiles/bashprofile.txt | dos2unix | sudo tee /home/$admin_username/.bash_profile

#sudo ln -s /bin/sh /home/$admin_username/programs/
sudo ln -s /home/datascience/venv/data-science/bin/jupyter /home/$admin_username/programs/

sudo chattr +i /home/$admin_username/.bash_profile
