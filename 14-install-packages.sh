#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
    echo "please run this script as root user"
    exit 1 # manually exit if error comes.
else
    echo "you are super user"

fi  

echo "all packages: $@"