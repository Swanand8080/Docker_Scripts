#!/bin/bash
#checking MySQL container named "MySQL" running in detach mode 
check=0
v1=$(docker ps | grep mysql)
if [ $? == 0 ]
then
  v2=$(docker ps | grep MySQL)
  if [ $? == 0 ]
  then
    v3=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    check=$((check+1))
    fi
  fi
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
    v7=$(docker ps | grep 10080)
    if [ $? == 0 ]
      then
      check=$((check+1)) 
      fi
    fi
  fi
fi
if [ $check == 2 ]
then
  echo "Task5 Ran Successfully"
else
  echo "Task5 did not Ran Successfully"
fi
