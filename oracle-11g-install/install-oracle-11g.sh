#!/bin/bash
#
# Script Variables
SOFTDIR=/mnt/hgfs/Downloads
#
sudo chown -R rjames:rjames $SOFTDIR/oracle11g-installer
# Prepare Silent Install Response File
#
# SEARCH1=oracle.install.option
# SEARCH2=ORACLE_HOSTNAME
# SEARCH3=oracle.install.db.config.starterdb.globalDBName
# SEARCH4=oracle.install.db.config.starterdb.SID
# SEARCH5=oracle.install.db.config.starterdb.characterSet
#
# The installation option can be one of the following
# 1. INSTALL_DB_SWONLY
# 2. INSTALL_DB_AND_CONFIG
# 3. UPGRADE_DB
SEARCH1=REPLACE-01
SEARCH2=REPLACE-02
SEARCH3=REPLACE-03
SEARCH4-REPLACE-04
SEARCH5=REPLACE-05
REPLACE1=INSTALL_DB_AND_CONFIG
REPLACE2=mbpro-vm-ora.lan
REPLACE3=orcl
REPLACE4=orcl
REPLACE5=AL32UTF8
cp $SOFTDIR/oracle11g-installer/oracle11g-silent-install.rsp /home/oracle
cp /home/oracle/oracle11g-silent-install.rsp /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH1/$REPLACE1/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH2/$REPLACE2/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH3/$REPLACE3/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH4/$REPLACE4/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH5/$REPLACE5/" >> /home/oracle/oracle11g-silent-install-run.rsp
#
# Copy and Unzip Installation Software
cp $SOFTDIR/linux.x64_11gR2_database_*.zip /home/oracle
unzip linux.x64_11gR2_database_1of2.zip
unzip linux.x64_11gR2_database_2of2.zip
# Install Oracle 11g Pre-reqs Package
sudo yum -y install oracle-rdbms-server-11gR2-preinstall
echo "oracle" | passwd --stdin oracle
#Disable selinux
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
#Disable firewall
sudo service iptables stop
sudo chkconfig iptables off
#Create oracle directories
sudo mkdir -p /u01/app/oracle/product/11.2.0/db_1
sudo chown -R oracle:oinstall /u01
sudo chmod -R 775 /u01
#Set Ownership on Installation Software to oracle user
sudo chown -R oracle:oinstall /home/oracle/database
sudo chown oracle:oinstall $SOFTDIR/oracle11g-installer/*.rsp
#Kick off Oracle silent install
/home/oracle/runInstaller -ignoreSysPrereqs -showProgress -silent -responseFile /home/oracle/oracle11g-silent-install-run.rsp

