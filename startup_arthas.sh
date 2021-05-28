#!/bin/bash


applicationName=$1


wget https://alibaba.github.io/arthas/arthas-boot.jar

containerId = `docker ps | grep ${applicationName} | awk '{print $1}'`

docker cp arthas-boot.jar ${containerId}:logs/

docker exec -it ${containerId} /bin/bash

cd logs

java -jar arthas-boot.jar