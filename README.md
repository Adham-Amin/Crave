# 🍔 Crave

A restaurant mobile application built with Flutter that lets users browse meals, manage a shopping cart, reserve tables, track orders, and calculate daily calorie needs.

## ✨ Features

- 🔐 **Authentication** — Login, registration, forgot/reset password, and phone verification with secure token storage
- 🏠 **Home** — Banner carousel, menu categories, recommended meals, and search
- 🍽️ **Meal Details** — Full meal info with macros breakdown (calories, protein, carbs, fat, weight)
- 🛒 **Shopping Cart** — Add/remove meals, adjust quantities, and place orders
- 🪑 **Table Reservation** — Browse available tables, select date/time/party size, and confirm bookings
- 📦 **Order History** — View past orders with product details and status
- 📋 **Table History** — View past table reservations
- ❤️ **Wishlist** — Save favorite meals
- 🔥 **Calorie Calculator** — Step-by-step wizard (gender, age, height, weight, activity level, goal) to calculate daily calorie needs
- 👤 **User Profile** — View account info, access orders/reservations/wishlist/calories, and logout
- 🎬 **Onboarding** — Splash screen and onboarding flow for first-time users
- 🌙 **Dark Mode** — Dark theme enabled by default

## 🛠️ Tech Stack

| Layer | Library |
|---|---|
| State Management | `flutter_bloc` (Cubit) |
| Dependency Injection | `get_it` |
| Networking | `dio` + `pretty_dio_logger` |
| Routing | `go_router` + `go_transitions` |
| Local Storage | `shared_preferences` + `flutter_secure_storage` |
| UI | `flutter_screenutil`, `google_fonts`, `google_nav_bar`, `carousel_slider`, `lottie`, `skeletonizer`, `cached_network_image`, `svg_flutter` |
| Functional | `dartz` (Either for error handling) |
| Forms | `pinput` (OTP input) |

## 🏗️ Architecture

The project follows **Clean Architecture** with a feature-first folder structure. This architecture separates concerns into distinct layers, making the codebase scalable, testable, and maintainable.

### 📐 Why Clean Architecture?

Clean Architecture enforces a **dependency rule** — outer layers depend on inner layers, never the reverse. This means:

- **Business logic is isolated** from UI and frameworks, so it can be tested independently
- **Swapping implementations** (e.g. replacing Dio with another HTTP client, or switching from a remote API to local cache) requires changes only in the data layer
- **Features are self-contained** — adding or removing a feature doesn't ripple across the codebase

### 📂 Project Structure

```
lib/
├── core/                    # Shared code used across all features
│   ├── di/                  # Service locator (get_it) — registers all dependencies
│   ├── errors/              # Failure classes for unified error handling
│   ├── functions/           # Extensions, validators, navigation helpers
│   ├── routing/             # GoRouter config and route constants
│   ├── services/            # ApiService (Dio), SharedPreferences, Bloc observer
│   ├── theme/               # Light and dark theme data
│   ├── utils/               # Colors, text styles, generated asset paths
│   └── widgets/             # Reusable UI components (buttons, text fields, dialogs)
│
├── features/                # Each feature is a self-contained module
│   ├── auth/                # 🔐 Login, register, forgot/reset password, verify phone
│   ├── home/                # 🏠 Home screen with banners, categories, meals
│   ├── meal_details/        # 🍽️ Meal detail page with macros
│   ├── meals/               # 📃 Meals listing by category
│   ├── cart/                # 🛒 Shopping cart management
│   ├── orders/              # 📦 Order history
│   ├── tables/              # 🪑 Table reservation flow
│   ├── table_history/       # 📋 Reservation history
│   ├── wishlist/            # ❤️ Favorite meals
│   ├── calories_store/      # 🔥 Calorie calculator wizard
│   ├── profile/             # 👤 User profile and settings
│   ├── intro/               # 🎬 Splash and onboarding screens
│   └── main/                # 🧭 Bottom navigation shell
│
└── main.dart                # App entry point
```

### 🧅 The Three Layers (per feature)

Each feature follows the same three-layer structure:

```
feature/
├── data/                    # ⬇️ Outermost layer — talks to the outside world
│   ├── datasources/         # Remote data sources (API calls via Dio)
│   ├── models/              # JSON serialization/deserialization models
│   └── repositories/        # Concrete implementations of domain repos
│
├── domain/                  # ⚙️ Middle layer — pure business logic
│   ├── entities/            # Core business objects (no framework dependencies)
│   └── repositories/        # Abstract repository interfaces (contracts)
│
└── presentation/            # 🎨 Innermost layer — UI and state
    ├── cubit/               # Cubits + States (BLoC pattern for state management)
    ├── pages/               # Screen-level widgets (entry points for each view)
    └── widgets/             # Smaller, reusable UI components for the feature
```

**How data flows through the layers:**

```
UI (Widget) → Cubit → Repository (interface) → Repository (impl) → DataSource → API
     ↑                                                                            |
     └────────────────────── Response / State update ←────────────────────────────┘
```

1. The **UI** dispatches an action to a **Cubit**
2. The Cubit calls a method on the **Repository interface** (domain layer)
3. The **Repository implementation** (data layer) delegates to a **DataSource**
4. The DataSource makes the actual **API call** and returns a model
5. The result flows back up — the Cubit emits a new **state**, and the UI rebuilds

Error handling uses `dartz`'s `Either<Failure, T>` type, so every repository method returns either a `Failure` or a success value — no exceptions leak across layer boundaries.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.10.7`
- Dart SDK (bundled with Flutter)

### Installation

```bash
git clone https://github.com/your-username/crave.git
cd crave
flutter pub get
flutter run
```

## 🌐 API

The app connects to a REST API hosted at `https://crave-back.onrender.com/api`. Authentication is handled via Bearer tokens stored in secure storage.
