#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run the script with root access."
else
    echo "you are the super user."
fi        

dnf install mysql -y

echo "is this script running?"