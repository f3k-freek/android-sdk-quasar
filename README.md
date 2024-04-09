# Android Quasar Docker Image

This Docker image is tailored for building Android applications with the Quasar Framework. It comes pre-configured with all the necessary tools and libraries for Android development, including specific versions of Quasar and Cordova.

## Versions and Components

### ubuntu2204-android33-node18-cordova12-quasar2

`f3ktech/android-sdk-quasar:ubuntu2204-android33-node18-cordova12-quasar2`

| Component              | Version                       |
|------------------------|-------------------------------|
| Base Image             | gradle:7.6-jdk11-jammy        |
| Ubuntu                 | 22.04 LTS                     |
| Gradle                 | 7.6                           |
| Node.js                | 18.x                          |
| npm                    | Corresponding to Node.js 18.x |
| Android SDK            | API level 33                  |
| Android Build Tools    | 33.0.3                        |
| Target Android Version | 13.0 (T)                      |
| Quasar CLI             | 2.4.0                         |
| Cordova                | 12.0.0                        |

### ubuntu2204-android30-node16-cordova12-quasar2

`f3ktech/android-sdk-quasar:ubuntu2204-android30-node16-cordova12-quasar2`

| Component              | Version                       |
|------------------------|-------------------------------|
| Ubuntu                 | 22.04 LTS                     |
| Node.js                | 16.x                          |
| npm                    | Corresponding to Node.js 16.x |
| Android SDK            | API level 30                  |
| Android Build Tools    | 30.0.3                        |
| Target Android Version | 11.0 (R)                      |
| Gradle                 | 7.1.1                         |
| Quasar CLI             | 2.3.0                         |
| Cordova                | 12.0.0                        |