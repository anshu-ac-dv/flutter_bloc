# 🚀 Flutter BLoC Journey

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![BLoC](https://img.shields.io/badge/BLoC-546E7A?style=for-the-badge&logo=google&logoColor=white)](https://pub.dev/packages/flutter_bloc)

A modern Flutter project dedicated to mastering state management with **BLoC** and improving development efficiency with tools like **Equatable**.

---

## 📈 Learning Progress

Track the evolution of this project as I dive deeper into the Flutter ecosystem.

- [x] **Phase 1: Foundations**
  - [x] Project structure initialization.
  - [x] Basic State Management (StatefulWidgets).
  - [x] Understanding Widget Trees and UI updates.
- [x] **Phase 2: Power Tools**
  - [x] Integrating **Equatable** for value-based equality.
  - [x] Optimizing performance by reducing unnecessary rebuilds.
  - [x] Clean debugging with `debugPrint`.
- [ ] **Phase 3: The BLoC Pattern** 🏗️
  - [x] Successfully integrated `flutter_bloc` & `bloc` dependencies.
  - [x] Resolved project naming conflicts (Renamed to `bloc_learning`).
  - [ ] Implementing `Bloc` and `Cubit`.
  - [ ] State vs. Events architecture.
  - [ ] Using `BlocProvider` and `BlocBuilder`.
- [ ] **Phase 4: Advanced Architecture**
  - [ ] Repository Pattern.
  - [ ] API Integration with BLoC.
  - [ ] Unit Testing for BLoC logic.

---

## ✨ Features

- **Value Equality**: Utilizes `Equatable` to compare objects by value rather than reference, perfect for state comparison.
- **Clean UI**: A polished Material 3 interface.
- **Robust Testing**: Includes smoke tests to ensure counter logic remains intact.

---

## 🧠 Lessons Learned

- **Dependency Naming**: Avoid naming your Flutter project the same as a package you intend to use (e.g., naming a project `flutter_bloc` while using the `flutter_bloc` package). This causes import conflicts and build failures.
- **Equatable for State**: Always use `Equatable` in BLoC states to prevent unnecessary UI rebuilds by ensuring state equality is checked by value, not reference.
- **ADB Storage**: Emulators can run out of storage space quickly. Regularly wiping data or increasing internal storage helps avoid "ADB Exit Code 1" errors.

---

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK (Channel Stable)
- Android Studio / VS Code

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/flutter_bloc.git
   ```
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## 🧪 Testing

Run the test suite to verify the logic:
```bash
flutter test
```

---

## 👨‍💻 Author
**Anshu**  
*Passionate Flutter Developer exploring the world of clean architecture.*

---
*Built with ❤️ and Flutter.*
