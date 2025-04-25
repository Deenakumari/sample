#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run the script with root access."
    exit 1 # manually exit if error comes.
else
    echo "you are the super user."
fi        

dnf install mysql -y

if [ $? ne 0 ]
then
    echo "Installation of mysql.. is FILURE"
    exit 1
else
    echo "installation of git is sucess"    
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo "installation of git is failure"
    exit 1
else
    echo "installation of git is sucess"    
fi    

echo "is this script running?"