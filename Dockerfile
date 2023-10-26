# Use the official Android Docker image as the base image
FROM androidsdk/android-30


ENV NODE_MAJOR=16

# Set up the workspace directory
WORKDIR /app

# Copy your Quasar app files into the container
COPY . .

# Install required packages
RUN apt-get update -y && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common

# Add the Node.js repository and its GPG key (same as before)
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN add-apt-repository "deb https://deb.nodesource.com/node_$NODE_MAJOR.x $(lsb_release -cs) main"

# Install Node.js and npm (same as before)
RUN apt-get update && apt-get install -y \
    nodejs

# Download and install Gradle 6
RUN curl -L https://services.gradle.org/distributions/gradle-6.3-bin.zip -o gradle-6.3-bin.zip \
    && mkdir /opt/gradle \
    && unzip -d /opt/gradle gradle-6.3-bin.zip \
    && rm gradle-6.3-bin.zip \
    && ln -s /opt/gradle/gradle-6.3/bin/gradle /usr/local/bin/gradle

# Clean up the package cache to reduce image size (same as before)
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD /opt/tools/entrypoint.sh built-in