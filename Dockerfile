FROM openjdk:8

# Copy the compiled WAR file from the target directory to the Tomcat webapps directory
#COPY target/WebApp.war /usr/local/tomcat/webapps/

ADD target/WebApp.war WebApp.war
ENTRYPOINT ["java", "-jar", "WebApp.war"]
EXPOSE 8081