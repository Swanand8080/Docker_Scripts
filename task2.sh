#!/bin/bash
#checking for alpine image
v1=$(docker images | grep alpine)
if [ $? == 0 ]
then 
  echo "Alpine is present on the local system"
fi
 
#checking for container named example2 running alpine 
v2=$(docker ps | grep alpine)
if [ $? == 0 ]
then
  v3=$(docker ps | grep example2)
  if [ $? == 0 ]
  then
    echo "Container named example2 is running alpine image"
  fi
else
echo "Container named example2 is not running alpine image"
fi

