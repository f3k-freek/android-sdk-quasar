# Android Quasar Docker Image

This Docker image is tailored for building Android applications with the Quasar Framework. It comes pre-configured with all the necessary tools and libraries for Android development, including specific versions of Quasar and Cordova.

## Base Image

The Docker image is based on:

`skumar2998/android-30-ubuntu-2204:latest`

This base image includes the Android SDK and build tools for API level 30, corresponding to Android 11.0 (R), as well as Ubuntu 22.04 LTS.

## Versions and Components

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

