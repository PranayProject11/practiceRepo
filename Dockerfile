# This Dockerfile is used for Java web applications packaged as WAR files and deployed on Tomcat. 
# It uses the official Tomcat 10 image with JDK 17, removes unnecessary default applications,
#  creates required directories, deploys the WAR file as the root application, 
#  exposes port 8080, and starts Tomcat using catalina.sh run. In a real CI/CD pipeline, 
#  Maven generates the WAR file, Docker packages it into an image, and the image is deployed to Docker,
#   Kubernetes, ECS, or EKS environments.

FROM tomcat:10-jdk17

WORKDIR /usr/local/tomcat

RUN rm -rf webapps/ROOT && \
    rm -rf webapps/examples && \
    mkdir -p logs && \
    chmod 755 webapps

COPY target/myapp.war webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh","run"]