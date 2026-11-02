#!/bin/bash

USERID=$(id -u) #Basically "id -u" command runs and give the user id

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run with root access"
else
echo "you are running with root access"
fi

dnf install mysql -y
