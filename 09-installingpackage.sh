#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]

then
    echo "ERROR:: please run the script with root access"
    exit 1
else
    echo "you are in root user"
fi

sudo yum install mysql -y