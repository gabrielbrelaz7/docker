
########################################## Enviroments variables declarations 

#ENV DEFAULT_NODE_VERSION = "v10.23.2"
#ENV DEFAULT_NPM_VERSION = "6.14.10"
#ENV DEFAULT_MAVEN_VERSION = "Apache Maven 3.6.3"

cd /Users/%username%/aem &&  chown -R %username%: 'crx-quickstart' &&  chmod -R 775 'crx-quickstart' && cd Users/%username%/aem/ 

########################################## Installing NPM
npm install npm@6.14.10

########################################## Installing Node.JS
npm install node@v10.23.2

########################################## Installing Maven

wget https://www.7-zip.org/a/7z2100-x64.exe && 7z2100-x64.exe

cd C:\ && mkdir maven && cd maven && wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip 

"c:\Program Files\WinRAR\WinRAR.exe" x "C:\maven\apache-maven-3.6.3-bin.zip" "C:\maven"

C:\maven>set PATH=%PATH%;C:\maven\apache-maven-3.6.3\bin

########################################## Configuring Maven properties ( .m2)

# Navigate to .m2 repository or create
# Change username and group properties in the path
# Change permissions in archive
# Enter 
# Delete older file settings.xml if exist

cd /Users/%username%/

IF EXIST ".m2" (
   chown -R %username%: .m2 && chmod -R 775 .m2 && cd .m2 & rm settings.xml
)
IF NOT EXIST ".m2" (
   mkdir .m2 && chown -R %username%: .m2 && chmod -R 775 .m2 && cd .m2 & rm settings.xml
)


# Download the file settings.xml
# Change username and group properties in the path
# Change permissions in archive
cd .m2 & wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Z4NcWiyCy4F2jHg30iIMiuiWq5AoqypT' -O settings.xml && chown %username%: 'settings.xml' &&  chmod 775 'settings.xml'


#Run the command below to check if the adobe-public profile is active.
cd Users/%username%/aem/ &&  mvn help:effective-settings

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
 java -Xms1024m -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar cq-quickstart-6.5.0.jar -v -r author,crx3 -p 4502 -nointeractive -nobrowser

# Navigate to the folder: aem-guides-wknd in the directory 
# Execute the following command
cd aem-guides-wknd && mvn -PautoInstallSinglePackage clean install
