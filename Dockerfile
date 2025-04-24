From tomcat:latest
Label author= Neha Dave
RUN apt-get update -y
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/