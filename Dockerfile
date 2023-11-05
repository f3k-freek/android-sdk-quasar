FROM skumar2998/android-30-ubuntu-2204:latest

RUN apt-get update -y && \
    apt-get install -y git ca-certificates curl gnupg software-properties-common jq && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_16.x $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y nodejs && \
    curl -L https://services.gradle.org/distributions/gradle-7.1.1-bin.zip -o gradle-7.1.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-7.1.1-bin.zip && \
    rm gradle-7.1.1-bin.zip && \
    ln -s /opt/gradle/gradle-7.1.1/bin/gradle /usr/local/bin/gradle

RUN npm install -g @quasar/cli@2.3.0 cordova@12.0.0

CMD /opt/tools/entrypoint.sh built-in