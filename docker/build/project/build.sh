# Date：2021-07-21 
# Author: Create by Meepo
# Description: docker run
# Version： 1.0

container_name=smart_city_1
image_name=smart_city
jar_dir=/usr/local/docker/smart-city
project_port=8001

docker stop ${container_name}
docker rm ${container_name}
docker rmi ${image_name}
cd ${jar_dir}
docker build -t ${image_name} .
docker run -d --name ${container_name} -p ${project_port}:${project_port} -v /usr/local/docker/smart-city/file/smartcity/:/home/eladmin/smartcity/ ${image_name}:latest
