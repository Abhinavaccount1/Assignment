FROM tomcat:8.0.20-jre8
COPY target/calc.war /usr/local/tomcat/webapps/calc.war