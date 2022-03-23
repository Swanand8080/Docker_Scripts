#!/bin/bash
#checking MySQL container named "MySQL" running in detach mode 

v1=$(docker ps | grep mysql)
if [ $? == 0 ]
then
  v2=$(docker ps | grep MySQL)
  if [ $? == 0 ]
  then
    v3=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    echo "Container named 'MySQL' is running mysql in detach mode"
    fi
  fi
else
echo "Container named 'MySQL' is not running mysql in detach mode"
fi

#checking gogs container named "gogs" running in detach mode 
v4=$(docker ps | grep gogs)
if [ $? == 0 ]
then
  v5=$(docker ps | grep gogs)
  if [ $? == 0 ]
  then
    v6=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    echo "Container named 'gogs' is running gogs in detach mode"
    v7=$(docker ps | grep 10080)
    if [ $? == 0 ]
      then 
      echo "gogs container is forwarded to 10080 port"
      fi
    fi
  fi
else
echo "Container named 'gogs' is not running gogs in detach mode"
fi

