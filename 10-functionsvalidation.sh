#!/bin/bash

ID=$(id -u)

VALIDATE(){

    if [ $1 -ne 0 ]

    then
        echo "ERROR::$2...  is FAILED"
    else
        echo "$2...is SUCCESS"
    fi

}

if [ $ID -ne 0 ]

then
    echo "ERROR:: please run the script with root access"
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y

VALIDATE $? "installing MySQL"

yum install git -y

VALIDATE $? "installing GIT"