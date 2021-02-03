#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
#apt-get -y install nginx
apt-get -y install git
git clone https://github.com/mauropm/aws-platzi-python.git
cd aws-platzi-python

apt-get -y install python-pip
pip install flask

nohup python app.py &
echo $HOME

# make sure nginx is started
#service nginx start