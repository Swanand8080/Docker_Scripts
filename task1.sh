#!/bin/bash
#checking for Ubuntu image
check=0
v1=$(docker images | grep ubuntu) 
if [ $? == 0 ]
then 
  #echo "ubuntu image is present"
  check=$((check+1))
fi

#checking ubuntu container named "Myapp" running in detach mode 

v2=$(docker ps | grep ubuntu)
if [ $? == 0 ]
then
  v3=$(docker ps | grep Myapp)
  if [ $? == 0 ]
  then 
    v4=$(docker ps | grep Up)
    if [ $? == 0 ]
    then 
      check=$((check+1))
      v5=$(docker exec -it Myapp ls / | grep sample )
      if [ $? == 0 ]
      then
        check=$((check+1))
        v6=$(docker exec -it Myapp ls /sample | grep abc.txt)
        if [ $? == 0 ]
        then
          check=$((check+1))
        fi
      fi 
    fi
  fi
fi


if [ $check == 4 ]
then
  echo "Task1 Ran Successfully"
else
  echo "Task1 did not Ran Successfully"
fi
