#!/bin/bash
#checking /test/test.txt in local system
FILE=/test/test.txt
if test -f "$FILE"; then
    echo "$FILE exists."
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
      echo "Centos container is running in the detach mode"
      v4=$(docker exec -it Myapp3 ls /tmp | grep test.txt)
      if [ $? == 0 ]
      then 
       echo "/tmp/test.txt is present in the CentOS Container"
      fi
    fi
  fi
else
echo "Centos container is not running in the detach mode"
fi

