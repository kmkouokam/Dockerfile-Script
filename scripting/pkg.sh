#!/bin/bash

# DESCRIPTION: Script To Build Dockerfile/Image
# AUTHOR: Ernestine
# Date: Dec 04, 2021

# Dockrfile Questions [Variables]
 Version=centos:7
 LABEL=kmkouokam@yahoo.com
 N_TAG=kmkouokam/desi-centos:7
 C_INST=yum
 Deamon=httpd
 TCP=88:80
 PTH=/var/www/html

# Dockerfile Script
 echo "FROM $Version" > Dockerfile
 echo "MAINTAINER $LABEL" >> Dockerfile

 echo "RUN $C_INST update -y" >> Dockerfile
 echo "RUN $C_INST install $Deamon -y" >> Dockerfile
 echo "RUN $C_INST -y install finger" >> Dockerfile
 echo "RUN $C_INST -y install curl" >> Dockerfile
 echo "RUN $C_INST -y install zip" >> Dockerfile
 echo "RUN $C_INST -y install vim" >> Dockerfile

 echo "EXPOSE 80" >> Dockerfile
 echo "COPY ./index.html $PTH" >> Dockerfile
 echo "CMD apachectl -D FOREGROUND" >> Dockerfile

# To Build Docker Image
 echo "Please wait while the Docker image is building...."
sleep 3
 docker build -t $N_TAG .
echo
# To Create Docker Container/Port
 docker run -d -p $TCP $N_TAG
echo
# To Checks Docker Info
 docker images
 docker ps
echo
 cat Dockerfile
echo
rm -f Dockerfile
#echo "push to docker hub"
 docker push $N_TAG
echo
echo "*****Thank you*****"