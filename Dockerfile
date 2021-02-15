FROM ubuntu:20.04

########################################## Enviroments variables declarations 
#ENV MINIMUN_MEMORY_RAM = "15985860"
#ENV DEFAULT_NODE_VERSION = "v10.23.2"
#ENV DEFAULT_JAVA_VERSION = "javac 11.0.10"
#ENV DEFAULT_NPM_VERSION = "6.14.10"
#ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

########################################## Move to root in the terminal
sudo cd /

########################################## Check and installing JAVA 

# Check Java Version and if existing one installation JAVA 
#sudo javac -version

# If necessary, update or install JAVA for variable value DEFAUL_JAVA_VERSION
sudo apt-get install openjdk-11-jdk
sudo apt install curl

# Move the download diretory path
cd /home/gabrielaraujo/Documentos

# Make a new folder to specific path and enter it
sudo mkdir "AEM Local Instance"

# Change username and group properties in the path
sudo chown $USER: 'AEM Local Instance'

# Enter in the path AEM Local Instance
cd "AEM Local Instance"

# Download the following files
sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt
sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties

# Change username and group properties in the path
sudo chown $USER: 'cq-quickstart-6.5.0.jar'
sudo chown $USER: 'license.properties'

# Change permissions in archive
sudo chmod 775 'cq-quickstart-6.5.0.jar'
sudo chmod 775 'license.properties'

# Execute the .jar file
sudo cq-quickstart-6.5.0.jar

# Change username and group properties in the path
sudo chown -R gabrielaraujo: 'crx-quickstart'

# Change permissions in archive
sudo chmod -R 775 'crx-quickstart'

# Execute the .jar file
sudo java -XX:MaxPermSize=2024m -Xmx2024M -jar cq-quickstart-6.5.0.jar -gui

# Download all files the AEM Service Packs
sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm" -O AEM-6.5.1.0.zip && rm -rf /tmp/cookies.txt

# Change username and group properties in the path
sudo chown $USER: 'AEM-6.5.1.0.zip'

# Change permissions in archive
sudo chmod 664 'AEM-6.5.1.0.zip'


# Access the package manager 

# Upload Packages in the package manager 

########################################## Installing Maven

# Check Maven Version and if existing one installation Maven in machine 

# Update and Installing Maven
sudo apt update
sudo apt install maven

########################################## Installing Node.JS

# Updating
sudo apt update

#Installing Node
sudo apt install nodejs

########################################## Installing NPM

# Update and Installing NPM
sudo apt update
sudo apt install npm

########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository or create
cd ../../
sudo mkdir .m2

# Change username and group properties in the path
sudo chown $USER: .m2

# Change permissions in archive
sudo chmod 664 .m2

# Enter 
cd .m2

# Delete older file settings.xml if exist
sudo rm settings.xml

# Download the file settings.xml
sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Z4NcWiyCy4F2jHg30iIMiuiWq5AoqypT' -O settings.xml

# Change username and group properties in the path
sudo chown $USER:settings.xml

# Change permissions in archive
sudo chmod 664 settings.xml

#Run the command below to check if the adobe-public profile is active.
sudo mvn help:effective-settings


########################################## Getting Started with AEM Sites 

# Navigate to the folder you would like to create the project
cd ../Documentos/

# Then run the following command
    mvn archetype:generate -B \
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
sudo java -XX:MaxPermSize=2024m -Xmx2024M -jar cq-quickstart-6.5.0.jar -gui

# Navigate to the folder: aem-guides-wknd in the directory 
cd aem-guides-wknd

# Execute the following command
sudo mvn -PautoInstallSinglePackage clean install

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["Você", "deve", "fazer", "uploads", "de", "todos", "services","packs", "dentro", "do", "CRX", "do", "Adobe Experience Manager"]