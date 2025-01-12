# SerpApi Hotels

## Overview

[Watch Preview Video](serp-hotels-preview.mp4)

Serp Hotels is a Dart-based hotel listing application that allows users to search, view, and manage their favorite hotels. The application utilizes various libraries and frameworks to provide a seamless user experience.
The project follows the principles of Clean Architecture, which emphasizes separation of concerns, making the codebase more maintainable, testable, and scalable. The architecture is divided into several layers, each with distinct responsibilities. The main layers are:

1. Presentation Layer
2. Domain Layer
3. Data Layer

```
+---------------------+
|  Presentation Layer |
|  (UI, Widgets,      |
|  State Management)  |
+---------------------+
          |
          v
+---------------------+
|     Domain Layer    |
|  (Use Cases,        |
|  Entities,          |
|  Repositories)      |
+---------------------+
          |
          v
+---------------------+
|      Data Layer     |
|  (Repositories,     |
|  Data Sources)      |
| (Shared Preferences)|
+---------------------+
```

*Benefits of Clean Architecture*

- ***Separation of Concerns:*** Each layer has a specific responsibility, making it easier to manage and understand the codebase.
- ***Testability:*** Each layer can be tested independently, allowing for unit testing of business logic and UI components.
- ***Scalability:*** New features can be added with minimal impact on existing code, as each layer can evolve independently.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Environment Configuration](#environment-configuration)
- [API Documentation](#api-documentation)

## Features

- Search for hotels based on various criteria.
- View detailed information about each hotel.
- Manage a list of favorite hotels.
- Responsive design for mobile and desktop users.
- Integration with external APIs for real-time data.
- Localize Strings within the App and allow user to freely change the app's language

### Technical features addressed

- State Management using the Bloc library for state management to handle business logic and app states (loading, success, error) and follow CLEAN architecture.

- Navigation using the Auto Route package for navigation between screens and for tab-based navigation.

- Local Storage using Shared Preferences to store and retrieve favorite hotels.

- Testing samples for a feature, which can be replicated to cater for other features

- CI and Documentation using github workflow to automate the entire process from testing, generating documentation and publishing the api documentation to github pages

## Installation

To get started with the project, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/BrianMuigai/Serp-hotels```

2. **Navigate to the project directory:**

    ```bash
    cd serp_hotels

3. **Install dependencies:**

    ```bash
    flutter pub get

- To Generate json-serialized files:- 

    ```bash
    dart run build_runner build

or watch for changes and build on save by

    dart run build_runner watch --delete-conflicting-outputs
    

### Environment Configuration

The project supports two environments which are autoloaded on launch depending on the build type: ***staging*** and ***Production***. To configure the environment, make sure you have an account at [Serp Api](https://serpapi.com/), then:-

- Navigate to the env folder
- Place your properties under ***.dev.env*** to work with debug/staging
- Place your properties under ***.env** to work with production or beta

4. **Run the application:**

    ```bash
    flutter run

## Usage

- Open the application on your emulator.
- Use the search functionality to find hotels and play around the search api
- Click on a hotel image to load it's best quality
- Add/remove hotels to your favourites list

## Api-Documentation

for indepth walk around of the project, refer the following links. 

- [Main Documentation](https://brianmuigai.github.io/Serp-hotels/)
