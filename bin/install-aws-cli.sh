#!/bin/bash

#curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip"
#cd /tmp
#unzip awscli-bundle.zip
#sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

cd ~/Downloads/
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
cd aws/
./install -i $HOME/Toolchains/aws-cli -b $HOME/bin
aws --version

