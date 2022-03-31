#!/bin/bash
mkdir /mydata
yum install autofs -y
systemctl start autofs
systemcrl enable autofs
mount 52.23.231.111:/nfsdata /mydata
 

