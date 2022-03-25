#!/bin/bash
echo "Enter your name"
read name
echo "Enter your email"
read email
mkdir /tmp/$email
 
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
MIIEpQIBAAKCAQEA1R1kh5FR0FrIpbxSsMQOC2nKYho17jwBSheFLBnJDD5HnQH6
GtxMxPyZwPcvhF/DBGyJ+PPjf1pHEZeN63e9es/m4yCPwCw5MIaDw4/upxwzFLpv
Y6hzzD0z4T9Bg2ABlNzmWV3llMT2RLTDT5FQ1Up2W/fqWRcZ7iqmgtI/Omy5vDTa
9xV4q6UFo2bmQYf+VuJBzwgZPwrPExeCcuCUYIdahq3huXw/NAptCpqX+ilPId1Y
SZeDtchvXU5ej+R4lnCB5geg8+JK9y41UEJdC0AXLrdBSnbj3KzjagxZm/O/EEpx
f3Y0fW1UktF+stfdnMSRpdW161XPCFEdjNwE9wIDAQABAoIBAFIvxacqeby6ZgrU
d6dH1Iq+P5hZt1aquWyTaX46a3hXRFLegk99ifWl3L24FhEcxR6dpQ/nLmLcs++q
3MZkJSSJrOcGlals5Jk8JvByP30euOxTgcWTHyUyrSE+vcsmaTW5gvQP7AvVcYvJ
klDLH7tBvid1kmDNMejRdemZn1yuANuSNieSChlzueIIt4bAKutugpcX11+EQWeZ
dhNJPaQJiY99hD90kfFHW/2eUFWSPukULE4mdAY/qvQpQA7dZxDjNlZzTpXIMR51
MZVoNfDGWyVo1Dyba+3Drrr0OyhqkMFBxKhTAzdFJhfdIj0JosMGPtBQ+H2kNYZT
SInrKsECgYEA+byzMh2GCnB+cPt3ZzniD78DIqEPVsdC3TG3dfEi8n1G4CdWBVh/
PtRIEnaluCfaBryi13gC+01LIFlVwHR39j9UqvkDCN9zEGvG6K8QBuOscC/QscTc
qBENqHh6wx9MBa+NDuT8DETcXrZlNC3/MH0NWfTFFdYcRHl/94JtUtECgYEA2nWU
UeejOdleA2N1H0vMkTpylFCwg9Y1C4IX2kzLGDOacp+cYD+YSPCMzJR1vFnZlD+E
eKbEdiDcRA7EP59uJpbG2E6LHeSY+KOHEDwM95nEmKz6RnUDwH5NHqME0GXeJTuu
woD0mdhWUexahhiMbWK4B42TPZUbNAfZpe/6fUcCgYEAuklOChYHxIXBa5nIqZF9
1W0Qc6ZcgMjGUaUiSrIC9YsJcW8mNXqcAEvtLwid+U6QzfGsLrnwz3AKmCjLVHIM
gf0ftSFmaBn2BMvAZhUgCWOPX2frbo+AYUXHQGIOgLo5xQv8Vp3sfWJoV6YKu++L
qam+admxoeZC07kmAYSi8+ECgYEA13/PbTBsct96/yq4WcQDK2wVpTsntRW0xAJ0
FzNT0S7ud439y3BQf/tTWWhF8CROHxC9U+tmuATYZAaRDxXtqgFoa+6nCzj6saNW
0+v4+rLkHZvdU22Q4u10k/lKAW3LwrzqOxLMt4qSNERMVCWZOTp9wW2mRsR0zlHE
IQ3m8ncCgYEAj7zufPEK7eC2kHzjHWCzDfnbc5MxAaIUdHAsO7oPpvvW9UUmHMAI
Ywz70UoCdi7j+mIG97rNoQiLJhSC0PE3dMdYyD+nbv2nQI6iu0bGXpSiVpodbxr7
qh6n6mTROdvWIqaFMBSzueZgQl431H5UGOtSm12dVoymuUWdE7bbg9k=
-----END RSA PRIVATE KEY-----" > /root/.ssh/id_rsa

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVHWSHkVHQWsilvFKwxA4LacpiGjXuPAFKF4UsGckMPkedAfoa3EzE/JnA9y+EX8MEbIn48+N/WkcRl43rd716z+bjII/ALDkwhoPDj+6nHDMUum9jqHPMPTPhP0GDYAGU3OZZXeWUxPZEtMNPkVDVSnZb9+pZFxnuKqaC0j86bLm8NNr3FXirpQWjZuZBh/5W4kHPCBk/Cs8TF4Jy4JRgh1qGreG5fD80Cm0Kmpf6KU8h3VhJl4O1yG9dTl6P5HiWcIHmB6Dz4kr3LjVQQl0LQBcut0FKduPcrONqDFmb878QSnF/djR9bVSS0X6y192cxJGl1bXrVc8IUR2M3AT3 root@localhost.localdomain" > /root/.ssh/id_rsa.pub 
git config --global user.name "Tshushima"
git config --global user.email tshushima11ghost.14@gmail.com
cd /tmp
git init 
git remote add origin git@github.com:Tshushima/Grading.git
git pull --rebase
git add $email
git commit -m "trying my best"
git push -u origin master
