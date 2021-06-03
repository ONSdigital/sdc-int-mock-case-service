FROM openjdk:11-jre-slim

ARG JAR_FILE=sdc-mock-case-service*.jar
RUN apt-get update
RUN apt-get -yq clean
RUN groupadd -g 989 sdc-mock-case-service && \
    useradd -r -u 989 -g sdc-mock-case-service sdc-mock-case-service
USER sdc-mock-case-service
COPY target/$JAR_FILE /opt/sdc-mock-case-service.jar

ENTRYPOINT [ "java", "-jar", "/opt/sdc-mock-case-service.jar" ]

