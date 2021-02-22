cd /

sudo mkdir -p /opt/aem/ && cd /opt/ && sudo chown $USER: 'aem' &&  sudo chmod 775 'aem' && cd /opt/aem/

sudo wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt &&  sudo chown -R $USER: 'cq-quickstart-6.5.0.jar' && sudo chmod -R 775 'cq-quickstart-6.5.0.jar'

sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties &&  sudo chown $USER: 'license.properties' && sudo chmod 775 'license.properties'

sudo java -Xms1024m -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar cq-quickstart-6.5.0.jar -v -r author,crx3 -p 4502 -nointeractive -nobrowser