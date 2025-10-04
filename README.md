# 📱 Flutter Clean Architecture - Categories App

A Flutter application demonstrating **Clean Architecture** principles with modern UI design and proper separation of concerns.

## 🎯 Project Overview

This project showcases a clean, maintainable Flutter app that fetches and displays categories from a REST API using Clean Architecture principles. The app features a modern white, black, and gray UI design with proper state management.

## 🏗️ Architecture

### Clean Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
│  │     Screens     │  │     Widgets     │  │    Cubit    │ │
│  │                 │  │                 │  │             │ │
│  │ CategoriesScreen│  │ CategoriesAppBar│  │CategoriesCubit│ │
│  │                 │  │ CategoriesList  │  │             │ │
│  │                 │  │ CategoryItem    │  │             │ │
│  └─────────────────┘  └─────────────────┘  └─────────────┘ │
└─────────────────────────────────────────────────────────────┘
                              ↑
                              │ depends on
                              │
┌─────────────────────────────────────────────────────────────┐
│                      DOMAIN LAYER                          │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
│  │   Use Cases     │  │   Interfaces    │  │  Entities   │ │
│  │                 │  │                 │  │             │ │
│  │GetCategoriesUseCase│ │CategoriesRepoInterface│ │   (Future)  │ │
│  │                 │  │                 │  │             │ │
│  └─────────────────┘  └─────────────────┘  └─────────────┘ │
└─────────────────────────────────────────────────────────────┘
                              ↑
                              │ implemented by
                              │
┌─────────────────────────────────────────────────────────────┐
│                       DATA LAYER                           │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────┐ │
│  │   Repository    │  │   Data Source   │  │   Models    │ │
│  │ Implementation  │  │                 │  │             │ │
│  │                 │  │   WebServices   │  │CategoriesModel│ │
│  │CategoriesRepoImpl│  │   (Retrofit)   │  │             │ │
│  └─────────────────┘  └─────────────────┘  └─────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow

```
UI (CategoriesScreen)
    ↓
Cubit (CategoriesCubit)
    ↓
Use Case (GetCategoriesUseCase)
    ↓
Repository Interface (CategoriesRepoInterface)
    ↓
Repository Implementation (CategoriesRepoImplementation)
    ↓
Data Source (WebServices)
    ↓
API (DummyJSON)
```

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/
│   │   └── simple_di.dart              # Dependency Injection
│   └── utils/
│       └── constant/
│           └── app_constant.dart       # App Constants
├── features/
│   ├── data/
│   │   ├── data_source/
│   │   │   ├── web_services.dart       # API Service (Retrofit)
│   │   │   └── web_services.g.dart     # Generated Retrofit Code
│   │   ├── models/
│   │   │   ├── categories.dart         # Data Models
│   │   │   └── categories.g.dart       # Generated JSON Code
│   │   └── repo_implementation/
│   │       └── categories_repo_implemntatio.dart
│   ├── domain/
│   │   ├── entities/                   # Domain Entities (Future)
│   │   ├── repo_interface/
│   │   │   └── categories_repo_interface.dart
│   │   └── use_case/
│   │       └── get_categories_use_case.dart
│   └── presentation/
│       ├── cubit/
│       │   ├── categories_cubit.dart   # State Management
│       │   ├── categories_state.dart   # State Definitions
│       │   └── categories_cubit.freezed.dart # Generated State Code
│       ├── screens/
│       │   └── categories_screen.dart  # Main Screen
│       └── widgets/                    # Reusable UI Components
│           ├── categories_app_bar.dart
│           ├── categories_floating_action_button.dart
│           ├── categories_initial_state.dart
│           ├── categories_loading_state.dart
│           ├── categories_success_state.dart
│           ├── categories_error_state.dart
│           ├── categories_header.dart
│           ├── categories_list.dart
│           ├── category_item.dart
│           ├── category_details_dialog.dart
│           └── category_detail_row.dart
└── main.dart                           # App Entry Point
```

## 🚀 Features

### ✨ UI Features

- **Modern Design**: Clean white, black, and gray color scheme
- **Responsive Layout**: Works on all screen sizes
- **State Management**: Proper loading, success, and error states
- **Interactive Elements**: Tap categories to view details
- **Smooth Animations**: Subtle shadows and transitions

### 🏛️ Architecture Features

- **Clean Architecture**: Proper layer separation
- **Dependency Injection**: Centralized DI container
- **State Management**: BLoC/Cubit pattern
- **Error Handling**: Comprehensive error states
- **Separation of Concerns**: Each widget has a single responsibility

## 🛠️ Technologies Used

### Core Technologies

- **Flutter**: UI Framework
- **Dart**: Programming Language

### State Management

- **flutter_bloc**: State management library
- **bloc**: Core BLoC library
- **freezed**: Immutable classes and unions

### Networking

- **dio**: HTTP client
- **retrofit**: Type-safe HTTP client
- **json_annotation**: JSON serialization

### Code Generation

- **build_runner**: Code generation runner
- **json_serializable**: JSON serialization code generation
- **retrofit_generator**: Retrofit code generation

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  dio: ^5.9.0
  flutter_bloc: ^9.1.1
  json_annotation: ^4.9.0
  retrofit: ^4.7.3
  freezed: ^3.2.3
  freezed_annotation: ^3.1.0
  bloc: ^9.0.1
  json_serializable: ^6.11.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.9.0
  retrofit_generator: ^10.0.6
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd test_apis
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate code**

   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🎨 UI States

### 1. Initial State

- Welcome screen with call-to-action
- "Load Categories" button
- Modern icon and typography

### 2. Loading State

- Circular progress indicator
- "Loading categories..." message
- Clean white container with shadow

### 3. Success State

- Header showing count of loaded categories
- List of category items with cards
- Tap any item to view details

### 4. Error State

- Error icon and message
- "Try Again" button
- User-friendly error handling

## 🔧 Configuration

### API Configuration

The app uses DummyJSON API for categories:

- **Base URL**: `https://dummyjson.com/`
- **Endpoint**: `products/categories`
- **Method**: GET

### Dependency Injection

All dependencies are managed through `SimpleDI`:

- Dio HTTP client configuration
- WebServices initialization
- Repository setup
- Use case creation
- Cubit instantiation

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Test Structure

```
test/
├── unit/
│   ├── cubit/
│   ├── use_case/
│   └── repository/
├── widget/
└── integration/
```

## 📱 Screenshots

### Initial State

- Clean welcome screen
- Modern typography
- Call-to-action button

### Success State

- Category list with cards
- Numbered items
- Tap for details

### Error State

- User-friendly error messages
- Retry functionality
- Consistent design

## 🎯 Clean Architecture Benefits

### 1. **Separation of Concerns**

- Each layer has a specific responsibility
- UI logic separated from business logic
- Data access isolated from domain logic

### 2. **Testability**

- Easy to unit test each layer
- Mock dependencies for testing
- Isolated business logic testing

### 3. **Maintainability**

- Changes in one layer don't affect others
- Easy to add new features
- Clear code organization

### 4. **Scalability**

- Easy to add new features
- Reusable components
- Modular architecture

## 🔄 State Management Flow

```
User Action → Cubit → Use Case → Repository → API
     ↓
UI Update ← State ← Cubit ← Use Case ← Repository
```

## 🎨 Design System

### Colors

- **Primary**: White backgrounds
- **Secondary**: Black (`Colors.black87`) for buttons
- **Tertiary**: Gray shades for text and UI elements
- **Background**: Light gray (`Colors.grey[50]`)

### Typography

- **Headers**: FontWeight.w700, large sizes
- **Body**: FontWeight.w600, medium sizes
- **Captions**: FontWeight.w400, small sizes

### Spacing

- **Padding**: 16px, 20px, 24px, 32px
- **Margins**: 12px, 16px, 20px
- **Border Radius**: 8px, 12px, 16px

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **DummyJSON** for providing the API
- **Flutter Team** for the amazing framework
- **BLoC Library** for state management
- **Clean Architecture** principles by Robert C. Martin

## 📞 Contact

For questions or suggestions, please open an issue or contact the development team.

---

**Happy Coding! 🚀**
#
