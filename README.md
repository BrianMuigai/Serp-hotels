# Buenro Hotels

## Overview

[Watch Preview Video](doc/buenro-preview.mp4)

Buenro Hotels is a Dart-based hotel booking application that allows users to search, view, and manage their favorite hotels. The application utilizes various libraries and frameworks to provide a seamless user experience.
The project follows the principles of Clean Architecture, which emphasizes separation of concerns, making the codebase more maintainable, testable, and scalable. The architecture is divided into several layers, each with distinct responsibilities. The main layers are:

1. Presentation Layer
2. Domain Layer
3. Data Layer

```
+---------------------+
|  Presentation Layer  |
|  (UI, Widgets,      |
|  State Management)   |
+---------------------+
          |
          v
+---------------------+
|     Domain Layer     |
|  (Use Cases,        |
|  Entities,          |
|  Repositories)      |
+---------------------+
          |
          v
+---------------------+
|      Data Layer      |
|  (Repositories,     |
|  Data Sources)      |
|  (Shared Preferences)|
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

## Installation

To get started with the project, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/buenro_hotels.git```

2. **Navigate to the project directory:**

    ```bash
    cd buenro_hotels

3. **Install dependencies:**

    ```bash
    flutter pub get

### Environment Configuration

The project supports two environments which are autoloaded on launch depending on the build type: ***staging*** and ***Production***. To configure the environment:-

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

for indepth walk around of the project, refer the following links. (on local machine and view with browser)

- [Main Documentation](doc/api/index.html)
- [Searchable documentation](doc/api/search.html)
