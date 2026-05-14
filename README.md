# 💠 Flutter BLoC Mastery: A State Management Journey

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-546E7A?style=for-the-badge&logo=google&logoColor=white)](https://pub.dev/packages/flutter_bloc)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

> **"Mastering BLoC isn't just about managing state; it's about architecting scalable, testable, and predictable applications."**

This repository documents my evolution from basic `setState` to the advanced **BLoC (Business Logic Component)** pattern. It serves as a showcase of clean architecture, dependency injection, and reactive UI implementation in Flutter.

---

## 🚀 Key Features

### 🔢 01. Counter Architecture
A fundamental implementation of discrete state transitions.
- **Concepts**: Events, States, and unidirectional data flow.
- **Optimization**: Used `Equatable` to prevent unnecessary rebuilds.

### 🎚️ 02. Reactive UI (Switch & Slider)
A complex state example managing multiple related UI components.
- **Concepts**: Multi-property states (Boolean + Double).
- **Behavior**: Smooth, real-time UI updates for toggles and opacity sliders.

### 📸 03. Native Integration (Image Picker)
Bridging the gap between BLoC and native device capabilities.
- **Concepts**: Async logic inside BLoC, Dependency Injection for Utils.
- **Features**: Seamless Camera capture and Gallery selection with state-driven UI feedback.

---

## 🛠️ Technical Excellence

### 🏗️ Dependency Injection & Multi-Bloc
Using `MultiBlocProvider` at the root of the app (`main.dart`) to ensure clean access to business logic without widget tree nesting.
```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => CounterBloc()),
    BlocProvider(create: (_) => SwitchBloc()),
    BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
  ],
  child: MyApp(),
)
```

### ⚡ Performance Optimization
- **Value Equality**: Every state extends `Equatable` to ensure the UI only rebuilds when data actually changes.
- **Lazy Loading**: Blocs are initialized only when needed by the widget tree.

---

## 🛤️ Roadmap & Progress

| Phase | Milestone | Status |
| :--- | :--- | :---: |
| **Phase 1** | Foundations (Material 3, Lifecycle, `setState`) | ✅ |
| **Phase 2** | Optimization (`Equatable`, Linter Compliance) | ✅ |
| **Phase 3** | BLoC Paradigm (Events, States, `BlocProvider`) | ✅ |
| **Phase 4** | Advanced Integration (Native APIs, Multi-Bloc) | 🔄 *In Progress* |
| **Phase 5** | Production Ready (Cubit, Repositories, API) | 📅 *Planned* |

---

## 🧠 Engineering Journal

### 📍 Conflict Resolution: Package Naming
**Issue**: Initially named the project `flutter_bloc`, causing a circular dependency error with the actual library.
**Solution**: Refactored the namespace to `bloc_learning`, a critical lesson in project naming conventions.

### 📍 Scalability: The Multi-Bloc Shift
As the project grew from a simple counter to a multi-feature app, I moved away from nested providers to `MultiBlocProvider`. This kept the `main.dart` clean and the architecture modular.

### 📍 Native Permissions & BLoC
Integrated the `ImagePicker` by abstracting the logic into a `Utils` class. Learned the importance of platform-specific configurations (`Info.plist` & `AndroidManifest.xml`) for camera access.

---

## 📂 Project Structure
```text
lib/
├── Bloc/                # Business Logic (Counter, Switch, ImagePicker)
├── Counter/             # UI Components for Counter
├── Switch/              # UI Components for Switch/Slider
├── ImagePicker/         # UI Components for Image Picker
├── Utils/               # Helper classes (Native API wrappers)
└── main.dart            # App entry point & Bloc orchestration
```

---

## 👨‍💻 Connect with Me
**Anshu** — *Flutter Enthusiast*  
Focusing on clean code and robust architecture.

---
*Crafted with ❤️ and BLoC.*
