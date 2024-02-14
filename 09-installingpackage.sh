#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]

then
    echo "ERROR:: please run the script with root access"
else
    echo "you are in root user"
fi

yum install mysql -y