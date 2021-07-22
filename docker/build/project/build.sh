# Date：2021-07-21 
# Author: Create by Meepo
# Description: docker run
# Version： 1.0

docker stop container_name
docker rm container_name
docker rmi image_name
cd /usr/local/docker/build/project
docker build -t image_name .
docker run -d --name container_name -p 8080:8080 -v /usr/local/docker/build/project/logs:/logs image_name:latest