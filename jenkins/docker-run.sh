#!/bin/bash

docker run \
  --rm \
  -u root \
  -idt \
  --name jenkins \
  -p 8080:8080 \
  -v /home/blockchain/workspace/docker/jenkins/jenkinshome:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  -v $(which docker):/usr/bin/docker \
  -v /usr/lib/x86_64-linux-gnu/libltdl.so.7:/usr/lib/x86_64-linux-gnu/libltdl.so.7 \
  jenkinsci/blueocean
