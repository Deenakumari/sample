#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status: $1"
    echo "what are you doing: $2"
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
VALIDATE $? "installing git"

echo "is this script running?"