#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ]

    then
        echo -e "ERROR::$2...  is $R FAILED"
    else
        echo -e "$2...is $G SUCCESS $N"
    fi

}

if [ $ID -ne 0 ]

then
    echo -e "$R ERROR:: please run the script with root access $N"
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing MySQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing GIT"