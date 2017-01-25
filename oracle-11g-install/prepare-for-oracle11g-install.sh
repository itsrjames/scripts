#!/bin/bash
DOWNLOADPATH=/Users/robertjames/Downloads
mkdir $DOWNLOADPATH/oracle11g-installer
ORAINSTALLPATH=$DOWNLOADPATH/oracle11g-installer
cp install-oracle-11g.sh $ORAINSTALLPATH
cp oracle11g-silent-install.rsp $ORAINSTALLPATH
chmod 777 $ORAINSTALLPATH/install-oracle-11g.sh
chmod 777 $ORAINSTALLPATH/oracle11g-silent-install.rsp
echo "All files have been copied to $ORAINSTALLPATH"
echo "1.Please ssh to the VM and logon as rjames"
echo "2.Change directory to /mnt/hgfs/Downloads/oracle11g-installer"
echo "3.chown install-oracle-11g.sh to rjames:rjames"
echo "4.chown rsp file to oracle:oinstall"
echo "5.Review and modify variables in install-oracle-11g.sh"
echo "6.Run install-oracle-11g.sh"
echo "Thankyou"
