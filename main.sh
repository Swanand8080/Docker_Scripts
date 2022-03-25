#!/bin/bash
echo "Enter your name"
read name
echo "Enter your email"
read email
mkdir /tmp/$email
touch /tmp/$email/README
echo "$name" > /tmp/$email/README
 
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
  touch /tmp/$email/1.txt
else
  echo "Task1 did not Ran Successfully"
fi

#TASK2
#checking for alpine image
v7=$(docker images | grep alpine)
if [ $? == 0 ]
then
  echo "Alpine is present on the local system"
fi

#checking for container named example2 running alpine 
v8=$(docker ps | grep alpine)
if [ $? == 0 ]
then
  v9=$(docker ps | grep example2)
  if [ $? == 0 ]
  then
    echo "Container named example2 is running alpine image"
  fi
else
echo "Container named example2 is not running alpine image"
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
  touch /tmp/$email/3.txt
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
  touch /tmp/$email/4.txt
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
      check=$((check+1))
      fi
    fi
  fi
fi
if [ $check == 2 ]
then
  echo "Task5 Ran Successfully"
  touch /tmp/$email/5.txt
else
  echo "Task5 did not Ran Successfully"
fi

echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEA8rQLEv+kejWb1NNgH1JHFci3oK1xakt+LYylVKFHhB0YBOKF
icNzr6pV0QAhfcu2hFUk4QeKXXO2Xcm9urBXkIImnTze+Tq+qWejLsiRKE4wzVsZ
kdEmSHvaB9sxEIPkLzPM6p9/ne+5HY7ENSpB2W6ytrW4T5kVicahPOwjiNwAi6w0
Cm/X57tIcmlLeuoYU307hE8lD/HOaBl4CrvBcX7gMJWY6gln5vD8HX4yj40rttZb
kdmNeMTLuQB350/hV/c/k56S/kgp/Czp0y9OxjshSVQRgTPAp7t3onAC/IlobrWh
OmSCku9VWAPxQr/rDpOSdZBFPwlB3m29WgDWwwIDAQABAoIBAQCS2rxEr6jvRZbYDVqBOUDH/p6Vu7z/i1R67Tpw3fGvEAejlQkmVbyfU1r/zqt1OZljsz1QaEahy01S
rKp/1wn057vDsrxcY95QFOSZf0TN9Znz+Cado8cdXsuLq2ahzpx4r0hTw1Tt1MrX
BrbUUJBtp1y9z3EJwOBWcHjJqzzJJt/6nMWT7iSNkfy6LE18tJE2SLuKh4WHYK71
urKjWs50R4OnzyIrkDOZdMV0B4LJVjptxKfwe6nQBkwTIXzuyuUT8jvpBQxd4vbz
ZQUrSUOEH/TDCsAaXtJVwZP3lrf7ZbtTiitAED5FoqnWtuiHP8WeUsbPkBR78bre
QDGB1DMZAoGBAP5rEKQr4envUw8QDaHMWYbIlqpi/GM8Q5gi210r9H7NK9uUDvoq
OtcIP5kHkuwwUkBMSPEFTezNM/Rw7P/LbAPgT12DMX2Y6hdmt0LMCImJpgRoaXnx
4NDZqGwR4+F259KsYSrzWhRmxWXz7gbmN+cimPDtLYyBsArhwHmaVFtNAoGBAPQ2
VSe1eOZ6Jl/R/vYhSCSNYu4l+96ombM6/JpvIy1yhNfnXIkhkb7yQFD/gvi+UNaQ
fEWVN8x3r+5Mu8FkWzFXM3mkU3Vfe/T9GWj5VWAS2ZN2hgFQ54xj5fx++iAnE6IA
91i9w5O9KKdhwbmykHDatSDWKhRGSpz+S/qmolJPAoGBAOCRsMa41VignzgUe3Pt
5LhMJnGPnigZ8bBAVFERk2a5w5S2Q+IdlIJqDXkObml83Z1TuK7Gd9ol505Ev22q
KVXikSuBuhWa/EZbrDeR0ZdVoO0THMc+8apn9Xou8G77ffU/oyU+WKzZajRr9Bay
73Vd3JINSL9VWgbA7hxoVT2hAoGATkdoLk1GDqKS0F4QmrZ6WHUVg/6a6Hkko0XC
GIKNRRETMd2QVMh03j7qjMwKIE9ovA4eN3OoKhsnQnxIJqpTbNJlxpT8x3+uzQ2f
6n0Zd60zHsh8FcnoHqEa5D+TT2EXMvOaVVCmcyHL+TMllK9/Cx2ft4HOhScu3XnJ
wvNMzpMCgYEA7Wpn5DpUVsrNP93AX/ES2dS18n6dZzSF7wOh435XRxeafF+QW0Bs
QXENGfMgz+ksLS7TLaSR7kA+aNDaPjqKS7yK0XdIW7Desbq8qQvE4C5lcyUwq6rk
TPBYSEUT8oa2dIaPoiy9PXqawRrwA8JgsCosPYbHVyb9RTYIogtRYpk=
-----END RSA PRIVATE KEY-----" > /root/.ssh/id_rsa

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDytAsS/6R6NZvU02AfUkcVyLegrXFqS34tjKVUoUeEHRgE4oWJw3OvqlXRACF9y7aEVSThB4pdc7Zdyb26sFeQgiadPN75Or6pZ6MuyJEoTjDNWxmR0SZIe9oH2zEQg+QvM8zqn3+d77kdjsQ1KkHZbrK2tbhPmRWJxqE87COI3ACLrDQKb9fnu0hyaUt66hhT
fTuETyUP8c5oGXgKu8FxfuAwlZjqCWfm8PwdfjKPjSu21luR2Y14xMu5AHfnT+FX9z+TnpL+SCn8LOnTL07GOyFJVBGBM8Cnu3eicAL8iWhutaE6ZIKS71VYA/FCv+sOk5J1kEU/CUHebb1aANbD root@localhost.localdomain" > /root/.ssh/id_rsa.pub


cd /tmp
git init
git pull --rebase https://github.com/Swanand8080/Grading
git remote add $email git@github.com:Swanand8080/Grading.git
git add .
git commit -m "Please work"
git push -u $email master
