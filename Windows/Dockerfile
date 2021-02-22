FROM ubuntu:20.04
FROM openjdk:11-jdk

# Move to diretory path 
RUN cd /Users/%username%/

# && Make a new folder to specific path and enter it
# && Change username and group properties in the path
# && Enter in the path aem
RUN  mkdir aem && cd /Users/%username%/ &&  chown %username%: 'aem' &&  chmod 775 'aem' && cd /Users/%username%/aem/

# Download the following file
# Change username and group properties in the path
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt &&   chown -R %username%: 'cq-quickstart-6.5.0.jar' &&   chmod -R 775 'cq-quickstart-6.5.0.jar'

# Download the following file
# Change username and group properties in the path
RUN  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties &&  chown %username%: 'license.properties' &&   chmod 775 'license.properties'

# Download all files the AEM Service Packs
# Change username and group properties in the path
# Change permissions in archive
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1dMir_9kThC8kvHDQdfPZyPsGXT41_rUm" -O AEM-6.5.1.0.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'AEM-6.5.1.0.zip' &&  chmod 775 'AEM-6.5.1.0.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1wmUHqcfLOddF-vo-AmsydOawTiECJQ4w' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1wmUHqcfLOddF-vo-AmsydOawTiECJQ4w" -O AEM-6.5.2.0.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'AEM-6.5.2.0.zip' &&  chmod 775 'AEM-6.5.2.0.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=11nPxtLhxdVysLi2u82zRyogq0vq93gmD' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=11nPxtLhxdVysLi2u82zRyogq0vq93gmD" -O aem-service-pkg-6.5.3.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'aem-service-pkg-6.5.3.zip' &&  chmod 775 'aem-service-pkg-6.5.3.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Tg6HMCD56aNIl4o11rByI0FjMBO1LO8t' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1Tg6HMCD56aNIl4o11rByI0FjMBO1LO8t" -O aem-service-pkg-6.5.4.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'aem-service-pkg-6.5.4.zip' &&  chmod 775 'aem-service-pkg-6.5.4.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1c_84WG6cMwUGkfob25z3Jal6zxQcqD8P' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1c_84WG6cMwUGkfob25z3Jal6zxQcqD8P" -O aem-service-pkg-6.5.5.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'aem-service-pkg-6.5.5.zip' &&  chmod 775 'aem-service-pkg-6.5.5.zip'
RUN  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1_2T5YFiCij0EwlGyAtnTVTMw1IysUSXO' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1_2T5YFiCij0EwlGyAtnTVTMw1IysUSXO" -O aem-service-pkg-6.5.6-1.0.zip && rm -rf /tmp/cookies.txt &&  chown %username%: 'aem-service-pkg-6.5.6-1.0.zip' &&  chmod 775 'aem-service-pkg-6.5.6-1.0.zip'

# Execute the .jar file
RUN java -Xms1024m -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar cq-quickstart-6.5.0.jar -v -r author,crx3 -p 4502 -nointeractive -nobrowser

# We can expose ports too, theses ports will can to be linked with others ports of host
EXPOSE 8000
EXPOSE 4502