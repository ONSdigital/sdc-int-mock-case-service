FROM openjdk:11-jre-slim

ARG JAR_FILE=mock-case-*.jar
RUN apt-get update
RUN apt-get -yq clean
RUN groupadd -g 989 mock-case && \
    useradd -r -u 989 -g mock-case mock-case
USER sdc-mock-case-service
COPY target/$JAR_FILE /opt/mock-case.jar

ENTRYPOINT [ "java", "-jar", "/opt/mock-case.jar" ]

