#!/bin/bash
sudo yum -y remove git
sudo yum -y groupinstall "Development Tools"
sudo yum -y install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
#Now download the latest source zip from git and unzip it and cd to it
echo -n "Where have you downloaded the GIT source code zip>"
read git-source-loc
cd $git-source-loc
ls *.zip
echo -n "What is the name of the GIT source zip file including extension>"
read git-zip-file
unzip $git-zip-file
ls -ltr
echo -n "What is the extracted GIT source zip directory>"
read $git-zip-directory
cd $git-zip-directory
make configure
./configure --prefix=/usr/local
sudo make install
cd ~
git --version
echo "--COMPLETE--"
