<div align="center">

<img src="https://codeclusive.io/blog/introduction-to-flutter-bloc/images/bloc.png" height="200" alt="BLoC Logo"/>

# 🚀 Flutter BLoC — Production-Grade Clean Architecture

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-State_Management-7952B3?style=for-the-badge)](https://bloclibrary.dev)
[![License](https://img.shields.io/badge/License-MIT-F97316?style=for-the-badge)](LICENSE)

**A production-grade Flutter application demonstrating industry-standard BLoC pattern, clean architecture principles, and scalable state management — built to showcase senior-level Flutter engineering practices.**

[🎯 Quick Start](#-quick-start) · [✨ Features](#-features) · [🏗️ Architecture](#️-architecture) · [📂 Structure](#-project-structure) · [🛠️ Tech Stack](#️-tech-stack) · [📖 Documentation](#-documentation)

</div>

---

## 🎯 Quick Start

Get up and running in minutes:

```bash
# 1. Clone the repository
git clone https://github.com/anshu-ac-dv/flutter_bloc.git
cd flutter_bloc

# 2. Install dependencies
flutter pub get

# 3. Generate code (build_runner)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run the application
flutter run
```

> **Prerequisites:** Flutter SDK `>=3.0.0` · Dart SDK `>=3.0.0`

---

## ✨ Features

<table>
<tr>
<td width="50%">

**🧱 BLoC Pattern**
- Full implementation of Business Logic Components
- Predictable, testable state management
- Event-driven architecture

**🏛️ Clean Architecture**
- Strict Data → Domain → Presentation separation
- Framework-agnostic domain layer
- High testability & maintainability

**🔄 Reactive Streams**
- Dart streams for unidirectional data flow
- Real-time state updates
- Predictable side effects

</td>
<td width="50%">

**🧪 Testable Codebase**
- 100% unit-testable BLoCs
- Mock-friendly dependency injection
- Comprehensive test examples included

**💉 Dependency Injection**
- Service locator pattern with `get_it`
- Decoupled components
- Easy to maintain & extend

**🌗 Dark Mode Support**
- Adaptive theming with system preferences
- Manual override capability
- Seamless mode switching

**📦 Modular Design**
- Feature-first folder structure
- Scalable to any project size
- Easy code splitting & lazy loading

</td>
</tr>
</table>

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles, ensuring business logic is completely decoupled from framework concerns.

### Layered Architecture

```
┌─────────────────────────────────────────────────────┐
│         PRESENTATION LAYER (UI & BLoCs)             │
│    Widgets ←→ BLoC Events ←→ BLoC States           │
├─────────────────────────────────────────────────────┤
│         DOMAIN LAYER (Business Rules)               │
│    Use Cases ←→ Repository Interfaces              │
├─────────────────────────────────────────────────────┤
│    DATA LAYER (APIs, Databases, Cache)             │
│  Repository Impl ←→ Remote/Local Data Sources      │
└─────────────────────────────────────────────────────┘
```

### Data Flow

```
User Interaction
        ↓
   UI Widget
        ↓
   Dispatch Event ──────────┐
        ↓                   ↓
     BLoC          Use Case (Business Logic)
        ↓                   ↓
   Emit State     Repository (Data Access)
        ↓                   ↓
  BlocBuilder     API / Database / Cache
        ↓
   UI Re-renders
```

---

## 📂 Project Structure

```
lib/
├── core/                          # Shared utilities & base classes
│   ├── error/
│   │   ├── exceptions.dart       # Custom exception definitions
│   │   └── failures.dart         # Error handling types
│   ├── usecases/
│   │   └── usecase.dart          # Base UseCase abstract class
│   └── utils/
│       ├── constants.dart        # App-wide constants
│       ├── helpers.dart          # Utility functions
│       └── logger.dart           # Logging utility
│
├── features/                      # Feature modules (scalable)
│   └── [feature_name]/
│       ├── data/                 # Data layer (external concerns)
│       │   ├── datasources/
│       │   │   ├── remote_datasource.dart
│       │   │   └── local_datasource.dart
│       │   ├── models/           # DTOs with JSON serialization
│       │   └── repositories/     # Concrete repository implementations
│       │
│       ├── domain/               # Domain layer (business logic)
│       │   ├── entities/         # Pure Dart business objects
│       │   ├── repositories/     # Abstract repository interfaces
│       │   └── usecases/         # Single-responsibility use cases
│       │
│       └── presentation/         # Presentation layer (UI)
│           ├── bloc/             # Events, States, BLoC classes
│           ├── pages/            # Full-screen widgets
│           └── widgets/          # Reusable UI components
│
├── config/
│   ├── router/                   # Navigation & routing
│   └── theme/                    # App theme & styles
│
└── main.dart                      # App entry point
```

---

## 🛠️ Tech Stack

| Category | Technology | Version |
|----------|-----------|---------|
| **Framework** | Flutter | 3.x+ |
| **Language** | Dart | 3.x+ |
| **State Management** | flutter_bloc | ^8.0.0 |
| **Dependency Injection** | get_it + injectable | Latest |
| **HTTP Client** | dio | Latest |
| **Local Storage** | shared_preferences / hive | Latest |
| **Serialization** | json_serializable + freezed | Latest |
| **Testing** | bloc_test + mocktail | Latest |

---

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/your_feature/bloc/your_bloc_test.dart

# Watch mode (re-run on file changes)
flutter test --watch
```

### BLoC Test Example

```dart
void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;
    late MockRepository mockRepository;

    setUp(() {
      mockRepository = MockRepository();
      counterBloc = CounterBloc(repository: mockRepository);
    });

    tearDown(() => counterBloc.close());

    blocTest<CounterBloc, CounterState>(
      'emits [CounterLoading, CounterLoaded] when Increment is added',
      build: () => counterBloc,
      act: (bloc) => bloc.add(IncrementEvent()),
      expect: () => [
        CounterLoading(),
        CounterLoaded(count: 1),
      ],
    );
  });
}
```

---

## 📚 Key Concepts

### 🔹 BLoC vs Cubit

| Aspect | BLoC | Cubit |
|--------|------|-------|
| **Complexity** | Complex features with multiple events | Simple state changes |
| **Events** | Yes, explicit events | No, direct method calls |
| **Use Cases** | API calls, multi-step workflows | Theme switching, toggles |
| **Learning Curve** | Steeper | Gentler |

### 🔹 Essential Patterns

- **BlocBuilder** — Rebuilds UI only when state changes
- **BlocListener** — Handles side effects (navigation, snackbars, dialogs)
- **BlocProvider** — Provides BLoC instance to widget tree
- **MultiBlocProvider** — Scope multiple BLoCs efficiently
- **RepositoryProvider** — Inject repositories as dependencies

---

## 🗺️ Roadmap

- [x] Core BLoC pattern implementation
- [x] Clean Architecture layer separation  
- [x] Dark mode & theming support
- [ ] Unit & widget test coverage >80%
- [ ] GitHub Actions CI/CD pipeline
- [ ] Offline-first support with local caching
- [ ] Internationalization (i18n/l10n)
- [ ] Advanced error handling & retry logic
- [ ] State persistence

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

### How to Contribute

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** changes: `git commit -m 'feat: add amazing feature'`
4. **Push** to the branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

### Code Style

- Follow Dart [effective style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Write comments for complex logic
- Keep functions small and focused

---

## 📖 Documentation

- **[Official BLoC Library](https://bloclibrary.dev)** — Complete BLoC documentation
- **[Clean Architecture Article](https://resocoder.com/flutter-clean-architecture)** — Deep dive into architecture
- **[Flutter Best Practices](https://flutter.dev/docs/testing)** — Testing & optimization

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

## 👨‍💻 Author

**Anshu** · Senior Flutter Developer

[![GitHub](https://img.shields.io/badge/GitHub-@anshu--ac--dv-181717?style=for-the-badge&logo=github)](https://github.com/anshu-ac-dv)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-anshu--ac--dv-0A66C2?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/anshu-ac-dv)

---

### ⭐ Show Your Support

If this project helped you learn BLoC and clean architecture, please give it a **star**!

> *"Great apps aren't built with great widgets — they're built with great architecture."*

Built with 💙 using **Flutter** & **Clean Architecture**

</div>
