#!/bin/bash
#checkig httpd image
check=0
v1=$(docker images | grep httpd)
if [ $? == 0 ]
then
  check=$((check+1))
fi

#checking for container Myapp2 with httpd image and detach mode
v2=$(docker ps | grep httpd)
if [ $? == 0 ]
then
  v3=$(docker ps | grep Myapp2)
  if [ $? == 0 ]
  then
    v4=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    check=$((check+1))
    fi
  fi
fi

#checking for port 8080 
v5=$(docker ps | grep 8080)
if [ $? == 0 ]
then 
  v6=$(curl localhost:8080)
  if [ $? == 0 ] 
  then
  check=$((check+1)) 
fi
fi

if [ $check == 3 ]
then
  echo "Task3 Ran Successfully"
else
  echo "Task3 did not Ran Successfully"
fi

