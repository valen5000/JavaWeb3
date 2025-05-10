# Use an official Tomcat image as a base
FROM tomcat:9-jdk11

# Copy the WAR file into the Tomcat webapps folder
COPY target/WebAppCal-0.0.6.war /usr/local/tomcat/webapps/JavaWeb3.war

# Expose port 8080 (default port for Tomcat inside the container)
EXPOSE 8080
