#!/bin/bash

USERID=$(id -u)

R="\e[31m" #Red Color
G="\e[32m" #Green Color
Y="\e[33m" #Yellow Color
N="\e[0m" #No Color

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER #creating the folder /var/log/shellscript-logs and "-p" option if already created then it will do nothing show as success

echo "Script Started excuting at $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then
echo -e " $R Error $N: Please run the script with root access" &>>$LOG_FILE
exit 1
else
echo -e " $G You are running script with root access $N " &>>$LOG_FILE
fi

#Creating Function with the name of VALIDATE where we are making repeated code at one place and calling whenever required
VALIDATE(){
    if [ $1 -eq 0 ]
    then
    echo -e "Installing $2 is... $G Success $N " &>>$LOG_FILE
    else
    echo -e "Installing $2 is... $R Failure $N " &>>$LOG_FILE
    exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... Going to install it" &>>$LOG_FILE

    dnf install mysql -y

    VALIDATE $? "MYSQL" #Calling the VALIDATE function by passing arguments $?- exit code and MYSQL is the package need to be installed

else 
    echo -e "MySQL is already $G installed $N ... $Y Nothing to do $N" &>>$LOG_FILE
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... Going to install it" &>>$LOG_FILE

    dnf install nginx -y
    
    VALIDATE $? "Nginx" #Calling the VALIDATE function by passing arguments $? and Nginix package which need to be installed

else
    echo -e "Nginx is already $G installed $N ... $Y Nothing to do $N" &>>$LOG_FILE
fi

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... Going to install it" &>>$LOG_FILE

    dnf install python3 -y

    VALIDATE $? "Python3" #Calling the VALIDATE function by passing arguments $? and Python3 package which need to be installed

else
    echo -e "Python3 is already $G installed $N... $Y Nothing to do $N" &>>$LOG_FILE
fi