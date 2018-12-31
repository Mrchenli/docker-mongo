#!/usr/bin/env bash

docker stack deploy -c stack.yml mongo_env

sleep 20s

a=$(docker container ls | grep "27017" | awk '{print $1}')

echo "container name is $a"

function ed(){
	result=(`bash -c "$1"`)
	echo ${result[0]}
}

docker cp ./mongo-init.sh $a:/

ed "docker exec $a /bin/bash -c '/mongo-init.sh'"
