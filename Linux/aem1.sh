#!/bin/bash

########################################## Enviroments variables declarations 

#ENV DEFAULT_NODE_VERSION = "v10.23.2"
#ENV DEFAULT_NPM_VERSION = "6.14.10"
#ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

cd /opt/aem && sudo chown -R $USER: 'crx-quickstart' && sudo chmod -R 775 'crx-quickstart' && cd /opt/aem 

sudo apt install curl

# sudo apt update && sudo tar -xvzf ~/Documentos/Github/ciandt/apache-maven-3.6.3-bin.tar.gz

# sudo nano /etc/environment


# sudo update-alternatives --install "/usr/bin/mvn" "mvn" "/opt/apache-maven-3.6.3/bin/mvn" 0
# sudo update-alternatives --set mvn /opt/apache-maven-3.6.3/bin/mvn
# sudo wget https://raw.github.com/dimaj/maven-bash-completion/master/bash_completion.bash --output-document /etc/bash_completion.d/mvn

########################################## Installing Node.JS

# Installing Node or updatting node js
# sudo apt update && apt install nodejs

# Installing correct node version in project like slides 
sudo apt update &&  sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && sudo apt-get install -y nodejs

########################################## Installing NPM

# Update and Installing NPM
sudo apt update && apt install npm

########################################## Installing Maven
# Update and Installing Maven
sudo apt update &&  sudo apt install maven  

########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository or create
# Change username and group properties in the path
# Change permissions in archive
# Enter 
# Delete older file settings.xml if exist

cd ~

if [ ! -d ".m2" ]; then
  sudo mkdir .m2 &&  sudo chown -R $USER: .m2 &&  sudo chmod -R 775 .m2 && cd .m2 &&  rm settings.xml
fi

if [ -d ".m2" ]; then
  sudo chown -R $USER: .m2 &&  sudo chmod -R 775 .m2 && cd .m2 &&  rm settings.xml
fi


# Download the file settings.xml
# Change username and group properties in the path
# Change permissions in archive
cd .m2 & wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Z4NcWiyCy4F2jHg30iIMiuiWq5AoqypT' -O settings.xml &&  sudo chown $USER: 'settings.xml' &&  sudo chmod 775 'settings.xml'


#Run the command below to check if the adobe-public profile is active.
cd /opt/aem/ && sudo mvn help:effective-settings

########################################## Getting Started with AEM Sites 

# Navigate to the folder you would like to create the project
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


#Executing .jar again
sudo java -Xms1024m -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar cq-quickstart-6.5.0.jar -v -r author,crx3 -p 4502 -nointeractive -nobrowser

# Navigate to the folder: aem-guides-wknd in the directory 
# Execute the following command
cd aem-guides-wknd && mvn -PautoInstallSinglePackage clean install
