FROM ubuntu:20.04
FROM openjdk:11-jdk
########################################## Enviroments variables declarations 
#ENV MINIMUN_MEMORY_RAM = "15985860"
#ENV DEFAULT_NODE_VERSION = "v10.23.2"
#ENV DEFAULT_JAVA_VERSION = "javac 11.0.10"
#ENV DEFAULT_NPM_VERSION = "6.14.10"
#ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

########################################## Check and installing JAVA 

# Check Java Version and if existing one installation JAVA 
# javac -version

# If necessary, update or install JAVA for variable value DEFAUL_JAVA_VERSION
#RUN cd / &&  apt-get install openjdk-11-jdk 
RUN cd / && apt install curl

# Move the download diretory path 
# && Make a new folder to specific path and enter it
# && Change username and group properties in the path
# && Enter in the path AEM Local Instance
RUN mkdir -p /opt/aem/ && cd /opt/aem
#&& chown $USER: 'AEM Local Instance' && cd "AEM Local Instance"

# Download the following file
# Change username and group properties in the path
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt &&  chown -R $USER: 'cq-quickstart-6.5.0.jar' &&  chmod -R 775 'cq-quickstart-6.5.0.jar'

# Download the following file
# Change username and group properties in the path
RUN  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties &&  chown $USER: 'license.properties' &&  chmod -R 775 'license.properties'

# Change username and group properties in the path
# Change permissions in archive
# Execute the .jar file
# User: admin
# Password: admin
RUN nohup java -jar cq-quickstart-6.5.0.jar & 


# Change username and group properties in the path
# Change permissions in archive
RUN  rm nohup.out &&  chown -R $USER: 'crx-quickstart' &&  chmod -R 775 'crx-quickstart'


# Download all files the AEM Service Packs
# Change username and group properties in the path
# Change permissions in archive
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm" -O AEM-6.5.1.0.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'AEM-6.5.1.0.zip' &&  chmod 664 'AEM-6.5.1.0.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1wmUHqcfLOddF-vo-AmsydOawTiECJQ4w' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1wmUHqcfLOddF-vo-AmsydOawTiECJQ4w" -O AEM-6.5.2.0.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'AEM-6.5.2.0.zip' &&  chmod 664 'AEM-6.5.2.0.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=11nPxtLhxdVysLi2u82zRyogq0vq93gmD' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11nPxtLhxdVysLi2u82zRyogq0vq93gmD" -O aem-service-pkg-6.5.3.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'aem-service-pkg-6.5.3.zip' &&  chmod 664 'aem-service-pkg-6.5.3.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Tg6HMCD56aNIl4o11rByI0FjMBO1LO8t' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1Tg6HMCD56aNIl4o11rByI0FjMBO1LO8t" -O aem-service-pkg-6.5.4.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'aem-service-pkg-6.5.4.zip' &&  chmod 664 'aem-service-pkg-6.5.4.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1c_84WG6cMwUGkfob25z3Jal6zxQcqD8P' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1c_84WG6cMwUGkfob25z3Jal6zxQcqD8P" -O aem-service-pkg-6.5.5.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'aem-service-pkg-6.5.5.zip' &&  chmod 664 'aem-service-pkg-6.5.5.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_2T5YFiCij0EwlGyAtnTVTMw1IysUSXO' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_2T5YFiCij0EwlGyAtnTVTMw1IysUSXO" -O aem-service-pkg-6.5.6-1.0.zip && rm -rf /tmp/cookies.txt &&  chown $USER: 'aem-service-pkg-6.5.6-1.0.zip' &&  chmod 664 'aem-service-pkg-6.5.6-1.0.zip'


# Access the package manager 

# Upload Packages in the package manager 

########################################## Installing Maven

# Check Maven Version and if existing one installation Maven in machine 

# Update and Installing Maven
RUN  apt update &&  apt install maven

########################################## Installing Node.JS

# Updating
# Installing Node
RUN  apt update && apt install nodejs

########################################## Installing NPM

# Update and Installing NPM
RUN  apt update && apt install npm

########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository or create
# Change username and group properties in the path
# Change permissions in archive
# Enter 
# Delete older file settings.xml if exist
RUN cd ~ &&  mkdir .m2 &&  chown $USER: .m2 &&  chmod 664 .m2 && cd .m2 &&  rm settings.xml


# Download the file settings.xml
# Change username and group properties in the path
# Change permissions in archive
RUN cd .m2 &  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Z4NcWiyCy4F2jHg30iIMiuiWq5AoqypT' -O settings.xml &&  chown $USER: 'settings.xml' &&  chmod 664 'settings.xml'

#Run the command below to check if the adobe-public profile is active.
RUN mvn help:effective-settings

########################################## Getting Started with AEM Sites 

# Navigate to the folder you would like to create the project
# Then run the following command

# #RUN cd /opt/aem/ && mvn archetype:generate -B \
#     -DarchetypeGroupId=com.adobe.granite.archetypes \
#     -DarchetypeArtifactId=aem-project-archetype \
#     -DarchetypeVersion=22 \
#     -DgroupId=com.adobe.aem.guides \
#     -Dversion=0.0.1-SNAPSHOT \
#     -DappsFolderName=wknd \
#     -DartifactId=aem-guides-wknd \
#     -Dpackage=com.adobe.aem.guides.wknd \
#     -DartifactName="WKND Sites Project" \
#     -DcomponentGroupName=WKND \
#     -DconfFolderName=wknd \
#     -DcontentFolderName=wknd \
#     -DcssId=wknd \
#     -DisSingleCountryWebsite=n \
#     -Dlanguage_country=en_us \
#     -DoptionAemVersion=6.5.0 \
#     -DoptionDispatcherConfig=none \
#     -DoptionIncludeErrorHandler=n \
#     -DoptionIncludeExamples=y \
#     -DoptionIncludeFrontendModule=y \
#     -DpackageGroup=wknd \
#     -DsiteName="WKND Site"

# After creating your new project using Archetype, run AEM instance again by executing the .jar file
RUN  nohup java -XX:MaxPermSize=2024m -Xmx2024M -jar cq-quickstart-6.5.0.jar &

# Navigate to the folder: aem-guides-wknd in the directory 
# Execute the following command
#RUN  rm nohup.out && cd aem-guides-wknd &&  mvn -PautoInstallSinglePackage clean install

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8080

# CMD is requirement, is the last command to be run when one container is created or restarted
CMD ["Você", "deve", "fazer", "uploads", "de", "todos", "services","packs", "dentro", "do", "CRX", "Packager", "Manager", "do", "AEM"]