#!/bin/bash
#checking for Ubuntu image
v1=$(docker images | grep ubuntu) 
if [ $? == 0 ]
then 
echo "ubuntu image is present"
else
echo "ubantu image is not present"
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
    echo "Container named 'Myapp' is running ubuntu in detach mode"
    fi
  fi
else  
echo "Container named 'Myapp' is not running ubuntu in detach mode"
fi

#checking /sample directory in Ubuntu container 
v5=$(docker exec -it Myapp ls / | grep sample )
if [ $? == 0 ]
then
  echo "/sample exists in the Myapp container"
  v6=$(docker exec -it Myapp ls /sample | grep abc.txt)
  if [ $? == 0 ]
  then
  echo "/sample/abc.txt exists in Myapp container "
  else
  echo "/sample/abc.txt does not exists in Myapp container "  
  fi
else
echo "/sample is does not exists in the Myapp container"
fi 

