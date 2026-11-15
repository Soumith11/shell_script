#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Error: Please run the script with root access"
exit 1
else
echo "You are running script with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo "Installing $2 is... Success"
    else
    echo "Installing $2 is... Failure"
    exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... Going to install it"

    dnf install mysql -y

    VALIDATE $? "MYSQL"

else 
    echo "MySQL is already installed... Nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... Going to install it"

    dnf install nginx -y
    
    VALIDATE $? "Nginx"
    
else
    echo "Nginx is already installed... Nothing to do"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... Going to install it"

    dnf install python3 -y

    VALIDATE $? "Python3"

else
    echo "Python3 is already installed... Nothing to do"
fi