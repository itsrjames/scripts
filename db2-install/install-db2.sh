#!/bin/bash
# Install some pre-req packages
sudo yum -y install pam-devel libpam pam.i686
# Copy and Unzip the Software
cp /mnt/hgfs/Downloads/DB2_Svr_10.5.0.3_Linux_x86-64.tar.gz /home/rjames/Downloads
tar xvf /home/rjames/Downloads/DB2_Svr_10.5.0.3_Linux_x86-64.tar.gz -C /home/rjames/Downloads
