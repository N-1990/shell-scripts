#!/bin/bash
ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R FAILED $N"
    else
        echo -e "$2 .. $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run the script with root user access $N"
    exit 1
else
    echo "your are in root user"    
fi

for package in $@
do
    yum list install $package
    if [ $? -ne 0 ]
    then 
        yum install $package -y
        VALIDATE $? "Istallation of $package"
    else
        echo -e "$package is already installed ... $Y SKIP $N"
    fi
done