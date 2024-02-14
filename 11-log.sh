#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S) #timestamp %F means formate of the time and date

LOGFILE="/tmp/$0-$TIMESTAMP.log" # logfiles will be saved in /etc file

echo "Script stated executing at $TIMESTAMP"

R="\e[31m" # these are the colours R means read colour
G="\e[32m" # green
Y="\e[33m" # yellow
N="\e[0m"  # Normal

VALIDATE(){

    if [ $1 -ne 0 ]

    then
        echo -e "ERROR::$2...  is $R FAILED $N"
    else
        echo -e "$2...is $Y SUCCESS $N"
    fi

}

if [ $ID -ne 0 ]

then
    echo -e "$R ERROR:: please run the script with root access $N" #this means between $R and $N will be change colour
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing MySQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing GIT"