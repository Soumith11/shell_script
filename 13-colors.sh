#!/bin/bash

USERID=$(id -u)

R="\e[31m" #Red Color
G="\e[32m" #Green Color
Y="\e[33m" #Yellow Color
N="\e[0m" #No Color

if [ $USERID -ne 0 ]
then
echo -e " $R Error $N: Please run the script with root access"
exit 1
else
echo " $G You are running script with root access $N "
fi

#Creating Function with the name of VALIDATE where we are making repeated code at one place and calling whenever required
VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e "Installing $2 is... $G Success $N "
    else
    echo -e "Installing $2 is... $R Failure $N "
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
    echo -e "MySQL is already $G installed $N ... $Y Nothing to do $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... Going to install it"

    dnf install nginx -y
    
    VALIDATE $? "Nginx" #Calling the VALIDATE function by passing arguments $? and Nginix package which need to be installed

else
    echo -e "Nginx is already $G installed $N ... $Y Nothing to do $N"
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... Going to install it"

    dnf install python3 -y

    VALIDATE $? "Python3" #Calling the VALIDATE function by passing arguments $? and Python3 package which need to be installed

else
    echo -e "Python3 is already $G installed $N... $Y Nothing to do $N"
fi