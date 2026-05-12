# 💠 Architecting the Counter: A BLoC State Management Journey

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-546E7A?style=for-the-badge&logo=google&logoColor=white)](https://pub.dev/packages/flutter_bloc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> "True state management is not just about changing variables; it's about predictable data flow and testable architecture."

This project documents my transition from simple `StatefulWidgets` to the robust **BLoC (Business Logic Component)** pattern. It is a live showcase of clean code principles, performance optimization, and problem-solving in the Flutter ecosystem.

---

## 🎯 Project Goals
*   **Predictability**: Implementing unidirectional data flow.
*   **Decoupling**: Separating Business Logic from the UI.
*   **Performance**: Using `Equatable` to eliminate redundant widget rebuilds.
*   **Quality**: Maintaining a "Green" test suite at every stage.

---

## 🛤️ Roadmap & Milestones

### 🟢 Phase 1: Foundations (Completed)
*   [x] Initialized project with Material 3.
*   [x] Mastered the Widget Tree and basic lifecycle.
*   [x] Implemented standard counter logic using `setState`.

### 🟡 Phase 2: Optimization (Completed)
*   [x] **Value-Based Equality**: Integrated `Equatable` for efficient object comparison.
*   [x] **Performance Auditing**: Reduced build cycles by optimizing state objects.
*   [x] **Linter Compliance**: Achieved a 100% clean `flutter analyze` report.

### 🟠 Phase 3: The BLoC Paradigm (Completed)
*   [x] **Infrastructure**: Successfully integrated `flutter_bloc` & `bloc`.
*   [x] **Architecture Pivot**: Resolved critical naming conflicts and refactored project structure to `bloc_learning`.
*   [x] **Event-Driven**: Implemented full `Bloc` for the Counter logic (Increment, Decrement, Reset).
*   [x] **UI Integration**: Connected `CounterBloc` to the UI using `BlocProvider` and `BlocBuilder`.
*   [ ] **Implementation**: Developing `Cubit` for simple state transitions.

### 🔴 Phase 4: Production Ready (Upcoming)
*   [ ] **Repository Pattern**: Abstracting data sources.
*   [ ] **API Integration**: Connecting to remote data services.
*   [ ] **Unit Testing**: 100% coverage for Bloc logic.

---

## 🧠 Engineering Journal: Problem Solving

### 1. The "Package vs Project" Naming Conflict
**Issue**: Named the project `flutter_bloc`, which collided with the library name, causing a circular dependency.
**Solution**: Refactored the entire project namespace to `bloc_learning` and updated all package-level imports.
**Takeaway**: Naming conventions in Dart are more than aesthetic; they are critical to the dependency graph.

### 2. ADB Code 1 (Storage Exhaustion)
**Issue**: Installation failure on Android Emulators due to insufficient storage partition.
**Solution**: Analyzed disk usage via `adb shell df -h`, cleared cache, and increased partition size in AVD settings.

### 3. Reactive UI with BlocBuilder
**Goal**: Efficiently rebuild only the necessary parts of the UI when the counter state changes.
**Solution**: Wrapped the counter text in a `BlocBuilder`. Used `context.read()` for event dispatching to keep the widget tree clean and performant.

---

## 🛠️ Tech Stack & Tools
*   **Framework**: Flutter (Stable)
*   **State Management**: BLoC / Cubit
*   **Utility**: Equatable (Value Equality)
*   **IDE**: Android Studio / VS Code
*   **Analysis**: Flutter Lints / Dart Analyzer

---

## ⚙️ Setup and Run

```bash
# Clone the repository
git clone https://github.com/yourusername/flutter_bloc.git

# Install dependencies
flutter pub get

# Run smoke tests
flutter test

# Launch application
flutter run
```

---

## 👨‍💻 About the Developer
**Anshu**  
*Flutter & Dart Enthusiast*

I am dedicated to building scalable, maintainable mobile applications. This repository reflects my commitment to continuous learning and technical excellence.

---
*Built with ❤️ by [Anshu](https://github.com/yourusername)*
