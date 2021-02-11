FROM ubuntu:20.04

########################################## Enviroments variables declarations 
ENV MINIMUN_MEMORY_RAM = "15985860"
ENV DEFAULT_NODE_VERSION = "v10.23.2"
ENV DEFAULT_JAVA_VERSION = "javac 11.0.10"
ENV DEFAULT_NPM_VERSION = "6.14.10"
ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"


########################################## Check and installing JAVA 

# Check Java Version and if existing one intallation JAVA in machine
sudo javac -version

# If necessary, update JAVA for variable value DEFAUL_JAVA_VERSION
sudo apt-get install openjdk-11-jdk


# Download the following files
Cq-quickstart-6.5.0.jar
License.properties

# Make a new folder to specific path

# Move the downloaded files into the new folder

# Execute the .jar file

# If the .jar file does not execute,  enable execution in properties> permissions


# Download all files the AEM Service Packs

# Move the downloaded folder to specific path

# Unzip the downloaded folder in path

# Access the package manager 

# Upload Packages in the package manager 


########################################## Installing Maven

# Check Maven Version and if existing one installation Maven in machine 
mvn --v

# Update and Installing Maven
sudo apt update
sudo apt install maven



########################################## Installing Node.JS

# Check Node Version and if existing one installation Maven in operation system 
node --version

# Update and Installing Maven
sudo apt update
sudo apt install nodejs


########################################## Installing NPM


# Check NPM Version and if existing one installation NPM in operation system 
node --version

# Update and Installing NPM
sudo apt update
sudo apt install nodejs


########################################## Installing NPM


# Check NPM Version and if existing one installation NPM in operation system 
node --version

# Update and Installing NPM
sudo apt update
sudo apt install nodejs


########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository
#$ cd /home/YOUR_USERNAME/.m2

# Check if the file settings.xml already exists in .m2 folder:
# ls

# if it doesn’t, create it with the command:
$ touch settings.xml or $ code settings.xml 


#Run the command below to check if the adobe-public profile is active.
$ mvn help:effective-settings


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


    # After creating your new project using Archetype, run AEM instance again by executing the .jar file

    # Navigate to the folder: aem-guides-wknd in the directory 

    # Execute the following command

    $ mvn -PautoInstallSinglePackage clean install


    ########################################## Open AEM Instance 





# The command RUN allow to run any script type bash or shell
RUN echo "This is text example with variable $DEFAULT_JAVA_VERSION"

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["echo", "${MINIMUN_MEMORY_RAM}"]





