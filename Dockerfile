From tomcat:latest
Label author=nehadave
Label info=thisprojecttakescodefromlocalpushestogitcreatecicdpipelineandlasttakesdockerfileinfoandpushesimagetodockerhubok
RUN apt-get update -y
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/