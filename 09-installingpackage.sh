#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]

then
    echo "ERROR:: please run the script with root access"
    exit 1
else
    echo "you are in root user"
fi

yum install mysql -y

if [ $? -ne 0 ]

then
    echo "ERROR:: installing mysql is FAILED"
else
    echo "installing msql is SUCCESS"
fi