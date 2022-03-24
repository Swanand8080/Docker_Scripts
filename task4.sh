#!/bin/bash
#checking /test/test.txt in local system
check=0
FILE=/test/test.txt
if test -f "$FILE"; 
then
  check=$((check+1))
fi

#checking Centos container running in the detach mode
v1=$(docker ps | grep centos)
if [ $? == 0 ]
then 
  v2=$(docker ps | grep Myapp3)
  if [ $? == 0 ]
  then 
    v3=$(docker ps | grep Up)
    if [ $? == 0 ]
    then 
      v4=$(docker exec -it Myapp3 ls /tmp | grep test.txt)
      if [ $? == 0 ]
      then
        check=$((check+1)) 
      fi
    fi
  fi
fi

if [ $check == 2 ]
then
  echo "Task4 Ran Successfully"
else
  echo "Task4 did not Ran Successfully"
fi

