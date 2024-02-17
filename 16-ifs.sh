#!/bin/bash

file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]  # ! denotes opposite means does not exist. "-f $file" means exist source-file"   
then
    echo -e "$R source directory: $file does not exists. $N "
fi

while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do 
    echo "userName: $username"
    echo "user ID: $user_id"
    echo "User Full Name: $user_fullname"

done < $file