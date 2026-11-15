#!/bin/bash

USERID=$(id -u) #Basically "id -u" command runs and give the user id

if [ $USERID -ne 0 ] #If the UserID is not equal to '0' they are not root user
then
echo "ERROR: Please run with root access"
exit 1 #You can enter any exit code other than 0 because if script is not successful we should failed exit status
else
echo "you are running with root access"
fi

dnf list installed mysql #Initially We are checking whether MYSQL is already installed or not

if [ $? -ne 0 ] #If the Exit Code not equal to Zero then MYSQL is not installed
    then
echo "MYSQL is not installed...Going to Install it"

dnf install mysql -y #Command to install MYSQL

    if [ $? -eq 0 ] #Verifying MYSQL installation status
    then
    echo "Installing MYSQL is Success"
    else
    echo "Installing MySQL is Failed"
    exit 1 #Exit code 1 will reflecting when the installation is failed
    fi
else
echo "MYSQL is already installed...Nothing to do" 
fi
