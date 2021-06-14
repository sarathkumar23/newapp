#!/bin/bash
	
source components/common.sh
OS_PREREQ


Head "Installing the  Redis"
apt install redis-server -y &>>$LOG
Check $?

Head "Updating the  Redis Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
Check $?

Head "Starting the  Redis Service"
systemctl restart redis
Check $?
