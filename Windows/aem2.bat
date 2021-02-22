cd /

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install wget

cd /Users/%username%/ && mkdir -p aem && chown %username%: 'aem' && chmod 775 'aem' && cd /Users/%username%/aem

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1CmCSTN-DmyfySf3ew5B3oVtIZAB6ZASs" -O cq-quickstart-6.5.0.jar && rm -rf /tmp/cookies.txt &&   chown -R /%username%: 'cq-quickstart-6.5.0.jar' &&  chmod -R 775 'cq-quickstart-6.5.0.jar'

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1aYf16-nRmRk3TM24srhC0-DVJz4NUQeP' -O license.properties &&   chown /%username%: 'license.properties' &&  chmod 775 'license.properties'

java -Xms1024m -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar cq-quickstart-6.5.0.jar -v -r author,crx3 -p 4502 -nointeractive -nobrowser