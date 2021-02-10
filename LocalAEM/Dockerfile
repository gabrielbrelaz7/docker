FROM node:alpine 

# Enviroments variables declarations 

ENV NODE_VERSION = "sudo node --version"
ENV JAVA_VERSION = "sudo javac -version"
ENV NPM_VERSION = "sudo npm --version"
ENV MAVEN_VERSION = "sudo mvn --v"

# Pre requisites for the local AEM instance

ENV DEFAULT_NODE_VERSION = "v10.23.2"
ENV DEFAULT_JAVA_VERSION = "javac 11.0.10"
ENV DEFAULT_NPM_VERSION = "6.14.10"
ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

RUN echo ${NODE_VERSION}


# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["Local","Enviroments","as", "Code"]