#!/bin/bash
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
mkdir -p /u01/app/oracle/product/11.2.0/db_1
chown -R oracle:oinstall /u01
chmod -R 775 /u01
#Need to dig out Oracle 11g response files in order to do a silent install
