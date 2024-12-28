# UserDefaults and Unit Testing Example on RickAndMortyAPI

This project demonstrates how to effectively use **UserDefaults** for data persistence in iOS applications and incorporates **Unit Testing** to ensure the reliability of the implementation.

## Why Use UserDefaults?

**UserDefaults** is a lightweight and efficient way to store small amounts of data that need to persist across app launches. It is commonly used for:

- Storing user preferences, such as theme selection or language settings.
- Saving simple application states, like whether a tutorial has been completed.
- Caching small amounts of frequently used data, such as user credentials or settings.

### Advantages of UserDefaults:
- **Simplicity**: Easy to use for storing and retrieving data with key-value pairs.
- **Efficiency**: Lightweight and optimized for small-scale data storage.
- **Persistence**: Data remains available even after the app is closed and reopened.

## Features

- **UserDefaults Integration**:
  - Save, retrieve, and delete user preferences and small data items.
  - Provides a lightweight and efficient solution for data persistence.

- **Unit Testing**:
  - Comprehensive test coverage for UserDefaults operations.
  - Mocking and testing custom wrappers for UserDefaults to ensure reliability.

## Technologies Used

This project leverages the following technologies:

- **Swift**: Programming language.
- **XCTest**: For writing and running unit tests.
- **UserDefaults**: For persistent data storage.

## Architecture and Development Principles

The following software architecture and principles are applied:

- **Custom UserDefaults Wrapper**:
  - Encapsulates UserDefaults operations for better modularity and testability.
  - Allows type-safe and reusable methods for data handling.

- **Unit Testing**:
  - Includes mock UserDefaults for isolated testing.
  - Verifies data saving, retrieval, and deletion.
