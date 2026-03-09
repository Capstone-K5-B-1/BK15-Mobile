# B1K5 Mobile

A Flutter mobile application built with Clean Architecture, featuring authentication and modular feature-based structure.

---

## Tech Stack

- **Framework**: Flutter (SDK ^3.7.2)
- **Language**: Dart
- **Architecture**: Clean Architecture (Data / Domain / Presentation)
- **State Management**: Provider (`ChangeNotifier`)
- **HTTP Client**: [`http`](https://pub.dev/packages/http)
- **Local Storage**: [`shared_preferences`](https://pub.dev/packages/shared_preferences)

---

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── config/           # App configuration
│   ├── constants/        # Colors, text styles, app constants
│   ├── error/            # Custom exception classes
│   ├── network/          # API endpoint definitions
│   ├── services/         # Shared services (e.g. Firebase, analytics)
│   ├── theme/            # App theme
│   └── utils/            # Utility/helper functions
├── features/
│   ├── auth/             # Authentication feature
│   │   ├── data/         # Remote & local data sources, models, repository impl
│   │   ├── domain/       # Entities, repository interface, use cases
│   │   └── presentation/ # UI pages, providers, widgets
│   └── home/             # Home feature (in progress)
└── shared/               # Shared widgets & components
```

---

## Features

### Authentication
- Login dengan email & password
- Registrasi akun baru (firstName, lastName, email, password)
- Logout
- Penyimpanan token secara lokal menggunakan SharedPreferences
- State management via `AuthProvider`

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) versi ^3.7.2
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone repository:
   ```bash
   git clone <repository-url>
   cd b1k5_mobile
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Konfigurasi Base URL API di:
   ```
   lib/features/auth/data/data_sources/auth_remote_datasource.dart
   ```
   Ganti `https://your-api.com` dengan URL API Anda.

4. Jalankan aplikasi:
   ```bash
   flutter run
   ```

---

## API Endpoints

| Endpoint              | Method | Deskripsi          |
|-----------------------|--------|--------------------|
| `/auth/login`         | POST   | Login pengguna     |
| `/auth/register`      | POST   | Registrasi akun    |
| `/auth/logout`        | POST   | Logout pengguna    |
| `/auth/refresh`       | POST   | Refresh token      |
| `/users/profile`      | GET    | Ambil profil       |
| `/users/change-password` | PUT | Ganti password     |

---

## Running Tests

```bash
flutter test
```
