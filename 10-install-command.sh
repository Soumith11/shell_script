#!/bin/bash

USERID=$(id -u) #Basically "id -u" command runs and give the user id

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run with root access"
exit 1 #You can enter any exit code other than 0
else
echo "you are running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing MYSQL is Success"
else
    echo "Installing MySQL is Failed"
    fi
