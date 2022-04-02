#!/bin/bash
echo "Enter your name"
read name
echo "Enter your email"
read email
mkdir /docker_data
apk add nfs-utils 
mount 54.221.116.109:/nfsdata /docker_data
mkdir /docker_data/$email
ls /docker_data

# TASK 1
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
  touch /docker_data/$email/1.txt
else
  echo "Task1 did not Ran Successfully"
fi

#TASK2
#checking for alpine image
check=0
v7=$(docker images | grep alpine)
if [ $? == 0 ]
then
   check=$((check+1))
fi

#checking for container named example2 running alpine 
v8=$(docker ps | grep alpine)
if [ $? == 0 ]
then
  v9=$(docker ps | grep example2)
  if [ $? == 0 ]
  then
    check=$((check+1))
  fi
fi

if [ $check == 1 ]
then
  echo "Task2 Ran Successfully"
  touch /docker_data/$email/2.txt
else
  echo "Task2 did not Ran Successfully"
fi

#TASK3
#checkig httpd image
check=0
v11=$(docker images | grep httpd)
if [ $? == 0 ]
then
  check=$((check+1))
fi

#checking for container Myapp2 with httpd image and detach mode
v12=$(docker ps | grep httpd)
if [ $? == 0 ]
then
  v13=$(docker ps | grep Myapp2)
  if [ $? == 0 ]
  then
    v14=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    check=$((check+1))
    fi
  fi
fi

#checking for port 8080 
v15=$(docker ps | grep 8080)
if [ $? == 0 ]
then
  v16=$(curl localhost:8080)
  if [ $? == 0 ]
  then
  check=$((check+1))
fi
fi

if [ $check == 3 ]
then
  echo "Task3 Ran Successfully"
  touch /docker_data/$email/3.txt
else
  echo "Task3 did not Ran Successfully"
fi

#TASK4
#checking /test/test.txt in local system
check=0
FILE=/test/test.txt
if test -f "$FILE";
then
  check=$((check+1))
fi

#checking Centos container running in the detach mode
v17=$(docker ps | grep centos)
if [ $? == 0 ]
then
  v18=$(docker ps | grep Myapp3)
  if [ $? == 0 ]
  then
    v19=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
      v20=$(docker exec -it Myapp3 ls /tmp | grep test.txt)
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
  touch /docker_data/$email/4.txt
else
  echo "Task4 did not Ran Successfully"
fi

#TASK5
#checking MySQL container named "MySQL" running in detach mode 
check=0
v21=$(docker ps | grep mysql)
if [ $? == 0 ]
then
  v22=$(docker ps | grep MySQL)
  if [ $? == 0 ]
  then
    v23=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    check=$((check+1))
    fi
  fi
fi

#checking gogs container named "gogs" running in detach mode 
v24=$(docker ps | grep gogs)
if [ $? == 0 ]
then
  v25=$(docker ps | grep gogs)
  if [ $? == 0 ]
  then
    v26=$(docker ps | grep Up)
    if [ $? == 0 ]
    then
    v27=$(docker ps | grep 10080)
    if [ $? == 0 ]
      then
        v28=$(docker inspect gogs | grep -i /MySQL:/gogs/MySQL)
        if 
          then 
	  check=$((check+1))
        fi 
      fi
    fi
  fi
fi
if [ $check == 2 ]
then
  echo "Task5 Ran Successfully"
  touch /docker_data/$email/5.txt
else
  echo "Task5 did not Ran Successfully"
fi


