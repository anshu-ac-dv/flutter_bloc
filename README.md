<div align="center">

<img src="https://codeclusive.io/blog/introduction-to-flutter-bloc/images/bloc.png" height="180" alt="BLoC Logo"/>

# 🚀 Flutter BLoC — Clean Architecture Showcase

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-State_Management-7952B3?style=for-the-badge)](https://bloclibrary.dev)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-4CAF50?style=for-the-badge)](https://github.com/anshu-ac-dv/flutter_bloc)
[![License](https://img.shields.io/badge/License-MIT-F97316?style=for-the-badge)](LICENSE)

<br/>

> **A production-grade Flutter application demonstrating industry-standard BLoC pattern, clean architecture principles, and scalable state management — built to showcase senior-level Flutter engineering.**

<br/>

[📱 Features](#-features) · [🏗️ Architecture](#️-architecture) · [📂 Project Structure](#-project-structure) · [🚀 Getting Started](#-getting-started) · [👨‍💻 Author](#-author)

---

</div>

<br/>

## ✨ Features

| Feature | Description |
|--------|-------------|
| 🧱 **BLoC Pattern** | Full implementation of Business Logic Components for predictable, testable state |
| 🏛️ **Clean Architecture** | Strict separation of Data → Domain → Presentation layers |
| 🔄 **Reactive Streams** | Leverages Dart streams for unidirectional data flow |
| 🧪 **Testable Codebase** | Every BLoC is independently unit-testable |
| 💉 **Dependency Injection** | Decoupled components via service locator pattern |
| 🌗 **Dark Mode** | Adaptive theming with system + manual override support |
| 📦 **Modular Design** | Feature-first folder structure for infinite scalability |

<br/>

## 🏗️ Architecture

This project strictly follows **Clean Architecture** — keeping business logic free from framework and UI concerns.

```
┌──────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                     │
│         Widgets  ←→  BLoC (Events / States)              │
├──────────────────────────────────────────────────────────┤
│                      DOMAIN LAYER                         │
│          Use Cases  ←→  Repository Interfaces            │
├──────────────────────────────────────────────────────────┤
│                       DATA LAYER                          │
│     Repository Impl  ←→  Remote/Local Data Sources       │
└──────────────────────────────────────────────────────────┘
```

### 🔁 BLoC Data Flow

```
UI Widget
   │  dispatches
   ▼
Event ──────► BLoC ──────► State
                │               │
                ▼               ▼
           Use Case        BlocBuilder
                │           re-renders UI
                ▼
           Repository
                │
                ▼
         Data Source (API / DB)
```

<br/>

## 📂 Project Structure

```
lib/
├── core/
│   ├── error/               # Failures & Exceptions
│   ├── usecases/            # Base UseCase contract
│   └── utils/               # Constants, helpers
│
├── features/
│   └── [feature_name]/
│       ├── data/
│       │   ├── datasources/ # Remote & local sources
│       │   ├── models/      # DTOs & JSON serialization
│       │   └── repositories/# Concrete implementations
│       │
│       ├── domain/
│       │   ├── entities/    # Pure Dart business objects
│       │   ├── repositories/# Abstract interfaces
│       │   └── usecases/    # Single-responsibility use cases
│       │
│       └── presentation/
│           ├── bloc/        # Events, States, BLoC
│           ├── pages/       # Screen widgets
│           └── widgets/     # Reusable UI components
│
└── main.dart
```

<br/>

## 🛠️ Tech Stack

<div align="center">

| Layer | Technology |
|-------|------------|
| **Framework** | Flutter 3.x |
| **Language** | Dart 3.x |
| **State Management** | `flutter_bloc` ^8.x |
| **Dependency Injection** | `get_it` + `injectable` |
| **Networking** | `dio` |
| **Local Storage** | `shared_preferences` / `hive` |
| **Serialization** | `json_serializable` + `freezed` |
| **Testing** | `bloc_test` + `mocktail` |

</div>

<br/>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code with Flutter extension

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/anshu-ac-dv/flutter_bloc.git
cd flutter_bloc

# 2. Install dependencies
flutter pub get

# 3. Generate code (if using build_runner)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run a specific test file
flutter test test/features/your_feature/bloc/your_bloc_test.dart
```

<br/>

## 🧪 BLoC Test Example

```dart
blocTest<CounterBloc, CounterState>(
  'emits [CounterLoading, CounterLoaded] when Increment is added',
  build: () => CounterBloc(repository: mockRepository),
  act: (bloc) => bloc.add(IncrementEvent()),
  expect: () => [
    CounterLoading(),
    CounterLoaded(count: 1),
  ],
);
```

<br/>

## 💡 Key BLoC Concepts Demonstrated

### 📌 Cubit (Simple state)
Used for lightweight features like theme switching and UI toggles — less boilerplate when events are straightforward.

### 📌 BLoC (Complex state)
Used for features involving API calls, error handling, and multi-step workflows — full Events → States pipeline.

### 📌 BlocBuilder
Rebuilds UI only when state changes, avoiding unnecessary renders.

### 📌 BlocListener
Side-effect handler (navigation, snackbars) that doesn't rebuild the widget tree.

### 📌 MultiBlocProvider
Scopes multiple BLoCs efficiently at the widget tree root.

<br/>

<br/>

## 🗺️ Roadmap

- [x] Core BLoC architecture implementation
- [x] Clean Architecture layer separation
- [x] Dark mode support
- [ ] Unit & widget test coverage > 80%
- [ ] CI/CD pipeline with GitHub Actions
- [ ] Offline-first support with local caching
- [ ] Internationalization (i18n)

<br/>

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

<br/>

---

<div align="center">

## 👨‍💻 Author

**Anshu** · Flutter Developer

[![GitHub](https://img.shields.io/badge/GitHub-anshu--ac--dv-181717?style=for-the-badge&logo=github)](https://github.com/anshu-ac-dv)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://linkedin.com)

<br/>

_"Great apps aren't built with great widgets — they're built with great architecture."_

<br/>

⭐ **If this project helped you learn BLoC, please give it a star!** ⭐

<br/>

<sub>Built with 💙 using Flutter & Clean Architecture</sub>

</div>
