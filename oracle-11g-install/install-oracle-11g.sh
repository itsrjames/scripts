#!/bin/bash
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
cp /mnt/hgfs/Downloads/oracle11g-silent-install.rsp /home/oracle
cp /home/oracle/oracle11g-silent-install.rsp /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH1/$REPLACE1/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH2/$REPLACE2/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH3/$REPLACE3/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH4/$REPLACE4/" >> /home/oracle/oracle11g-silent-install-run.rsp
cat /home/oracle/oracle11g-silent-install-run.rsp | sed -e "s/$SEARCH5/$REPLACE5/" >> /home/oracle/oracle11g-silent-install-run.rsp
#
# Unzip Installation Software
unzip linux.x64_11gR2_database_1of2.zip
unzip linux.x64_11gR2_database_2of2.zip
#Need to have a fully qualified host in /etc/hosts
yum -y install oracle-rdbms-server-11gR2-preinstall
echo "oracle" | passwd --stdin oracle
#Disable selinux
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
#Disable firewall
service iptables stop
chkconfig iptables off
#Create oracle directories
sudo mkdir -p /u01/app/oracle/product/11.2.0/db_1
sudo chown -R oracle:oinstall /u01
sudo chmod -R 775 /u01
#Need to dig out Oracle 11g response files in order to do a silent install
