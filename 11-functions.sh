#!/bin/bash

USERID=$(id -u)

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
    echo "please run the script with root access."
    exit 1 # manually exit if error comes.
else
    echo "you are the super user."
fi        

dnf install mysql -y
VALIDATE $? "installing mysql"

dnf install git -y
VALIDATE $? "installing mysql"

echo "is this script running?"