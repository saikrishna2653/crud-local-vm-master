### vi Dockerfile
# Pull base image 
FROM java:8-jdk-alpine

COPY ./crud-0.0.1-SNAPSHOT.war /usr/app/

WORKDIR /usr/app

RUN sh -c 'touch crud-0.0.1-SNAPSHOT.war'

ENTRYPOINT ["java","-jar","crud-0.0.1-SNAPSHOT.war"]
