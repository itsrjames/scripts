#!/bin/bash
MYIP=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
MYHOSTNAME=$(hostname)
echo $MYIP
echo $MYHOSTNAME
RESULT=`echo -e $MYIP"\t"$MYHOSTNAME`
echo "$RESULT" >> /etc/hosts
