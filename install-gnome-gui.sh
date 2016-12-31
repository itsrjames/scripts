#!/bin/bash
yum -y groupinstall "X Window System" Desktop "General Purpose Desktop" "Graphical Administration Tools" "Legacy X Window System compatibility"
sed -i 's|id:3:initdefault:|id:5:initdefault:|g' /etc/inittab
