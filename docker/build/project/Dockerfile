FROM java:8
    
#设置时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone
    
ADD *.jar app.jar

ENTRYPOINT ["java","-jar","-Dspring.profiles.active=dev","/app.jar"]



