#!/bin/bash

read -p "Please enter the username: " USERNAME

docker run -it --rm -v $PWD/../config:/mosquitto/config eclipse-mosquitto mosquitto_passwd -c /mosquitto/config/passwords.txt $USERNAME