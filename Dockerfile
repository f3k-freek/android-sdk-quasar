FROM gradle:8.7-jdk17-jammy

ENV ANDROID_HOME /usr/lib/android-sdk

ENV PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

RUN apt-get update -y &&  \
    apt-get install -y git ca-certificates curl gnupg software-properties-common jq unzip

RUN mkdir -p /usr/lib/android-sdk/cmdline-tools && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
    unzip -o cmdline-tools.zip -d /usr/lib/android-sdk/cmdline-tools && \
    rm cmdline-tools.zip

RUN chmod +x /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager && \
    yes | /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager --sdk_root=/usr/lib/android-sdk --licenses

RUN /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager --sdk_root=/usr/lib/android-sdk "platforms;android-34" "build-tools;34.0.0"

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_18.x $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y nodejs

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @quasar/cli@2.4.1 cordova@13.0.0