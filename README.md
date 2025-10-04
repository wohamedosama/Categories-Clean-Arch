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
