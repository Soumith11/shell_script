#!/bin/bash

USERID=$(id -u) #Basically "id -u" command runs and give the user id

if [ $USERID -ne 0 ]
then
echo "ERROR: Please run with root access"
exit 1 #You can enter any exit code other than 0
else
echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
    then
echo "MYSQL is not installed...Going to Install it"

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing MYSQL is Success"
else
    echo "Installing MySQL is Failed"
    exit 1 #Exit code 1 will reflecting when the installation is failed
fi
    else
echo "MYSQL is already installed...Nothing to do"
fi
