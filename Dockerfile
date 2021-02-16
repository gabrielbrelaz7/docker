FROM ubuntu:20.04

########################################## Enviroments variables declarations 
#ENV MINIMUN_MEMORY_RAM = "15985860"
#ENV DEFAULT_NODE_VERSION = "v10.23.2"
#ENV DEFAULT_JAVA_VERSION = "javac 11.0.10"
#ENV DEFAULT_NPM_VERSION = "6.14.10"
#ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

########################################## Move to root in the terminal


########################################## Check and installing JAVA 

# Check Java Version and if existing one installation JAVA 
#sudo javac -version

# If necessary, update or install JAVA for variable value DEFAUL_JAVA_VERSION
RUN sudo cd / && sudo apt-get install openjdk-11-jdk 
RUN sudo cd / &&sudo apt install curl

# Move the download diretory path 
# && Make a new folder to specific path and enter it
# && Change username and group properties in the path
# && Enter in the path AEM Local Instance
RUN cd $HOME/Documentos && sudo mkdir "AEM Local Instance" && sudo chown $USER: 'AEM Local Instance' && cd "AEM Local Instance"

# Download the following file
# Change username and group properties in the path
RUN sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt && sudo chown $USER: 'cq-quickstart-6.5.0.jar'

# Download the following file
# Change username and group properties in the path
RUN sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties && sudo chown $USER: 'license.properties'

# Change username and group properties in the path
# Change permissions in archive
# Execute the .jar file
RUN sudo chown -R gabrielaraujo: 'crx-quickstart' && sudo chmod -R 775 'crx-quickstart' && sudo cq-quickstart-6.5.0.jar

# Execute the .jar file
RUN sudo java -XX:MaxPermSize=2024m -Xmx2024M -jar cq-quickstart-6.5.0.jar -gui

# Download all files the AEM Service Packs
# Change username and group properties in the path
# Change permissions in archive
RUN sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm" -O AEM-6.5.1.0.zip && rm -rf /tmp/cookies.txt && sudo chown $USER: 'AEM-6.5.1.0.zip' && sudo chmod 664 'AEM-6.5.1.0.zip'

# Access the package manager 

# Upload Packages in the package manager 

########################################## Installing Maven

# Check Maven Version and if existing one installation Maven in machine 

# Update and Installing Maven
RUN sudo apt update && sudo apt install maven

########################################## Installing Node.JS

# Updating
# Installing Node
RUN sudo apt update && sudo apt install nodejs

########################################## Installing NPM

# Update and Installing NPM
RUN sudo apt update && sudo apt install npm

########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository or create
# Change username and group properties in the path
# Change permissions in archive
# Enter 
# Delete older file settings.xml if exist
RUN cd ../../ && sudo mkdir .m2 && sudo chown $USER: .m2 && sudo chmod 664 .m2 && cd .m2 && sudo rm settings.xml


# Download the file settings.xml
# Change username and group properties in the path
# Change permissions in archive
RUN sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Z4NcWiyCy4F2jHg30iIMiuiWq5AoqypT' -O settings.xml && sudo chown $USER:settings.xml && sudo chmod 664 settings.xml

#Run the command below to check if the adobe-public profile is active.
RUN sudo mvn help:effective-settings


########################################## Getting Started with AEM Sites 

# Navigate to the folder you would like to create the project
# Then run the following command

RUN cd ../Documentos/ && mvn archetype:generate -B \
    -DarchetypeGroupId=com.adobe.granite.archetypes \
    -DarchetypeArtifactId=aem-project-archetype \
    -DarchetypeVersion=22 \
    -DgroupId=com.adobe.aem.guides \
    -Dversion=0.0.1-SNAPSHOT \
    -DappsFolderName=wknd \
    -DartifactId=aem-guides-wknd \
    -Dpackage=com.adobe.aem.guides.wknd \
    -DartifactName="WKND Sites Project" \
    -DcomponentGroupName=WKND \
    -DconfFolderName=wknd \
    -DcontentFolderName=wknd \
    -DcssId=wknd \
    -DisSingleCountryWebsite=n \
    -Dlanguage_country=en_us \
    -DoptionAemVersion=6.5.0 \
    -DoptionDispatcherConfig=none \
    -DoptionIncludeErrorHandler=n \
    -DoptionIncludeExamples=y \
    -DoptionIncludeFrontendModule=y \
    -DpackageGroup=wknd \
    -DsiteName="WKND Site"

# After creating your new project using Archetype, run AEM instance again by executing the .jar file
RUN sudo java -XX:MaxPermSize=2024m -Xmx2024M -jar cq-quickstart-6.5.0.jar -gui

# Navigate to the folder: aem-guides-wknd in the directory 
# Execute the following command
RUN cd aem-guides-wknd && sudo mvn -PautoInstallSinglePackage clean install

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["Você", "deve", "fazer", "uploads", "de", "todos", "services","packs", "dentro", "do", "CRX", "Packager", "Manager", "do", "AEM"]