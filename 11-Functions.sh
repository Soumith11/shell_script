#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Error: Please run the script with root access"
exit 1
else
echo "You are running script with root access"
fi

#Creating Function with the name of VALIDATE where we are making repeated code at one place and calling whenever required
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

    VALIDATE $? "MYSQL" #Calling the VALIDATE function by passing arguments $?- exit code and MYSQL is the package need to be installed

else 
    echo "MySQL is already installed... Nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... Going to install it"

    dnf install nginx -y
    
    VALIDATE $? "Nginx" #Calling the VALIDATE function by passing arguments $? and Nginix package which need to be installed

else
    echo "Nginx is already installed... Nothing to do"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... Going to install it"

    dnf install python3 -y

    VALIDATE $? "Python3" #Calling the VALIDATE function by passing arguments $? and Python3 package which need to be installed

else
    echo "Python3 is already installed... Nothing to do"
fi