# 🚀 ReactiveHub

**ReactiveHub** is a high-performance Flutter application designed to showcase advanced **State Management** patterns and **Reactive Programming** principles. The project serves as a blueprint for building scalable, maintainable, and testable mobile applications using modern architectural standards.

---

## 🏗 Architecture & Design Patterns
The project is built following **Clean Architecture** principles to ensure a strict separation of concerns:

* **Presentation Layer:** Functional UI components with reactive state observers.
* **Domain Layer:** Pure business logic, entities, and use cases (independent of frameworks).
* **Data Layer:** Robust repository pattern handling local (Hive/Sqflite) and remote (REST API/Firestore) data sources.

## 🛠 Tech Stack
* **Framework:** [Flutter](https://flutter.dev)
* **State Management:** [Riverpod / BLoC / Provider] 
* **Networking:** Dio with interceptors for seamless API communication.
* **Dependency Injection:** Get_it / Manual injection for modularity.
* **Functional Programming:** Dartz for elegant error handling (Either type).

## ✨ Key Technical Features
* **Reactive State Updates:** Zero-lag UI updates driven by streamlined data flows.
* **Optimized Rebuilds:** Strategic use of selectors and consumers to maintain 60/120 FPS.
* **Global Error Handling:** A centralized system to manage exceptions and user feedback.
* **Clean Code:** Strictly following SOLID principles and DRY (Don't Repeat Yourself).

## 📁 Project Structure
```text
lib/
 ├── core/          # Core utilities, theme, and common widgets
 ├── features/      # Modular feature-based structure (e.g., Auth, Home)
 │    ├── data/     # Models and Repositories
 │    ├── domain/   # Entities and Use Cases
 │    └── presentation/ # UI Screens and State Providers/Blocs
 └── main.dart      # App entry point & initialization