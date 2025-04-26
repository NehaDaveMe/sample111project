From tomcat:latest
Label author=nehadave
RUN apt-get update -y
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/