# Use the official Tomcat 9 image as the base image
FROM tomcat:9.0.55-jdk8-openjdk

# Copy the compiled WAR file from the target directory to the Tomcat webapps directory
COPY target/WebApp.war /usr/local/tomcat/webapps/