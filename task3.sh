#!/bin/bash
#checkig httpd image
v1=$(docker images | grep httpd)
if [ $? == 0 ]
then
  echo "httpd images is present on the system"
else
echo 
echo "httpd images is not present on the system"
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
    echo "Container named 'Myapp2' is running httpd in detach mode"
    fi
  fi
else
echo "Container named 'Myapp2' is not running httpd in detach mode"
fi

#checking for port 8080 
v5=$(docker ps | grep 8080)
if [ $? == 0 ]
then 
  v6=$(curl localhost:8080)
  if [ $? == 0 ] 
  then 
  echo "container is forwarded to port 8080"
fi
fi
