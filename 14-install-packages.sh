#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE(){
   # echo "exit status: $1"
   # echo "what are you doing: $2"
   if [ $1 -ne 0 ]
   then 
       echo "$2...failure"
       exit 1
    else 
        echo "$2...sucess"
    fi    
}

if [ $USERID -ne 0 ]
then 
    echo "please run this script as root user"
    exit 1 # manually exit if error comes.
else
    echo "you are super user"

fi  

for i in $@
do 
  echo "package to install: $i"
  dnf list installed $i &>>$LOGFILE
  if [ $? -eq 0]
  then
      echo -e "$i already installed...$Y skipping..$N"
   else
       echo "$i not installed.. need to install"   
   fi
done  