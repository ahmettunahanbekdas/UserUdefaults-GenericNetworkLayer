# Generic Network Layer and UserDefaults Example With RickAndMory API

This project demonstrates the implementation of a **Generic Network Layer** for reusable and scalable API communication and the integration of **UserDefaults** for lightweight data persistence in iOS applications.

## Features

- **Generic Network Layer**:
  - Reusable, type-safe, and scalable network requests.
  - Supports HTTP methods such as GET and POST.
  - Built using `URLSession` with customizable request and response handling.

- **UserDefaults Integration**:
  - Simple key-value storage for user preferences and small data items.
  - Encapsulated in a custom wrapper for better modularity and reusability.

## Why Use This Project?

This project offers a modular and efficient architecture for handling common development tasks:

### Advantages of the Generic Network Layer:
- **Reusability**: A single network manager that can handle multiple API requests.
- **Type-Safety**: Ensures data decoding with Swift's `Codable` protocol.
- **Scalability**: Designed to easily expand for additional HTTP methods or advanced networking features.

### Advantages of UserDefaults:
- **Lightweight Persistence**: Ideal for saving small amounts of user-specific data.
- **Simplicity**: Easy-to-use API for data storage and retrieval.
- **Custom Wrapping**: Enhances testability and organizes code better.

## Technologies Used

This project leverages the following technologies:

- **Swift**: Programming language.
- **URLSession**: For handling network requests.
- **UserDefaults**: For persistent local storage.

## Architecture and Development Principles

- **Generic Network Layer**:
  - Encapsulates network logic into a reusable and type-safe component.
  - Supports customizable request building and response parsing.

- **Custom UserDefaults Wrapper**:
  - Provides a clean and modular interface for accessing UserDefaults.
  - Ensures type-safety and enhances code readability.
