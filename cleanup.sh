#!/bin/sh
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker image rm $(docker image ls)
docker volume prune