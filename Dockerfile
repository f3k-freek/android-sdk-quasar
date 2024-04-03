FROM gradle:7.6-jdk11-jammy

# Set the Android SDK environment variable
ENV ANDROID_HOME /usr/lib/android-sdk

# Add the Android SDK tools to the PATH environment variable
ENV PATH $PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Update and install essential packages
RUN apt-get update -y &&  \
    apt-get install -y git ca-certificates curl gnupg software-properties-common jq unzip

# Download and setup Android command line tools
RUN mkdir -p /usr/lib/android-sdk/cmdline-tools && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip && \
    unzip -o cmdline-tools.zip -d /usr/lib/android-sdk/cmdline-tools && \
    rm cmdline-tools.zip

# Set execute permissions and accept licenses
RUN chmod +x /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager && \
    yes | /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager --sdk_root=/usr/lib/android-sdk --licenses

# Install Android 33 SDK and build tools 33.0.2
RUN /usr/lib/android-sdk/cmdline-tools/cmdline-tools/bin/sdkmanager --sdk_root=/usr/lib/android-sdk "platforms;android-33" "build-tools;33.0.2"

# Add NodeSource's repository for Node.js 16 and install Node.js
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_18.x $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y nodejs

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g @quasar/cli@2.4.0 cordova@12.0.0