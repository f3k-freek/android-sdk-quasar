FROM ubuntu:22.04

# Update and install essential packages
RUN apt-get update -y && \
    apt-get install -y git ca-certificates curl gnupg software-properties-common jq unzip

# Install Java, required by Android SDK
RUN apt-get install -y openjdk-11-jdk

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

# Install Gradle
RUN curl -L https://services.gradle.org/distributions/gradle-7.1.1-bin.zip -o gradle-7.1.1-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-7.1.1-bin.zip

