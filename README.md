# Clean Architecture [Provider] Todo App

This repository contains a Todo application built using the Clean Architecture approach in Flutter.

## Features

- **Clean Architecture**: The app is structured following the principles of Clean Architecture, with separation of concerns between the presentation, domain, and data layers.
- **Provider State Management**: State management is handled using the Provider package for managing the state of the application.
- **Material Design**: The app follows Material Design principles for a cohesive and intuitive user experience.
- **CRUD Operations**: The app supports basic CRUD (Create, Read, Update, Delete) operations for managing Todo items.

## Components

- **Domain Layer**: Contains the business logic and entities representing Todo items.
- **Data Layer**: Handles data access and implements repository interfaces defined in the domain layer.
- **Presentation Layer**: Builds the user interface and manages the state of the application using the Provider package.

## Getting Started

To run the application:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the application on your preferred device or simulator.

## Structure

```
clean_architecture_todo/
|-- lib/
|   |-- features/
|       |-- todo/
|           |-- domain/
|               |-- entities/
|               |-- repositories/
|               |-- usecases/
|           |-- data/
|               |-- datasources/
|               |-- models/
|               |-- repositories/
|           |-- presentation/
|               |-- pages/
|               |-- provider/
|               |-- widgets/
```

## Dependencies

- **Flutter**: Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Provider**: State management package for Flutter applications, used for managing application state in a scalable and efficient way.

## Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

