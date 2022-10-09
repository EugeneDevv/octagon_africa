# Octagon App

Sample Savings Application

## Table of Contents

- [Octagon App](#octagon-app)
  - [Table of Contents](#table-of-contents)
  - [Project setup](#project-setup)
    - [Project prerequisites](#project-prerequisites)
    - [How to setup and run Weather App](#how-to-setup-and-run-weather-app)
  - [Architecture and Codebase](#architecture-and-codebase)

## Project setup

### Project prerequisites

1. The **Octagon App** runs on Flutter version 3.0.4. To check the flutter version and channel installed in your machine run `flutter --version`.

2. To switch from another channel of Flutter to the stable channel run `flutter channel stable`.

3. To install Flutter version 3.0.4 run `flutter version v3.0.4`.

Looks like we are done with the prerequisites :-)

### How to setup and run Weather App

1. Use `git clone git@github.com:EugeneDevv/octagon_africa.git` to clone this project.

2. Navigate into the project directory.

3. Run

```sh
    flutter run
```

## Architecture and Codebase

The project is built using the DDD(Domain Driven Design) architectural pattern. DDD allows for the separation of concern which also makes scalability and testing easier.
The project has been written in Flutter and Dart language. For state management async_redux is used because of its efficiency and ease of configuration.
