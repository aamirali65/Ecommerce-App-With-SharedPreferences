# FACIO — Ecommerce App with SharedPreferences

A complete Flutter ecommerce UI with **offline authentication and session persistence
powered by [`shared_preferences`](https://pub.dev/packages/shared_preferences)**.
Register a user, sign in, stay signed in across app restarts, and sign out — no backend
required.

Built with Material 3, clean routing, and zero API calls: everything is stored locally
on the device.

---

## Features

- **Splash screen** that reads the saved session and routes to *Home* or *Login*
- **Register** — saves `name`, `email` and `password` to local storage
- **Login** — validates the credentials against the stored session
- **Stay signed in** — the `checkLogin` flag keeps you logged in after an app restart
- **Logout** — clears the session flag in one tap from the Settings page
- **Home** — product grid with search, notifications and profile actions
- **Product detail** — image, description, price and add-to-cart actions
- **Search** — filter the catalogue as you type
- **Cart** — quantity controls ( + / − ) and order summary
- **Settings** — account, address, country, currency, language, notifications, privacy
- **Bottom navigation** — Home · Cart · Settings
- Runs on **Android, iOS, Web, Windows, macOS and Linux**

## Tech stack

| Layer      | Choice |
|------------|--------|
| Framework  | Flutter 3.x (Material 3) |
| Language   | Dart 3 |
| Local storage | `shared_preferences` |
| HTTP client | `http` (available for future API work) |
| Lints      | `flutter_lints` |

## How SharedPreferences is used

| Key         | Type   | Written on          | Read on            | Purpose |
|-------------|--------|---------------------|--------------------|---------|
| `name`      | String | Register            | —                  | Display name of the user |
| `email`     | String | Register            | Login              | Account identifier |
| `pass`      | String | Register            | Login              | Password check (demo only) |
| `checkLogin`| bool   | Login (`true`), Logout (`false`) | Splash | Session flag — decides the start screen |

> ⚠️ This project stores credentials locally for **learning purposes**. Never ship plain
> text passwords to production — use a real auth API and hashed credentials instead.

## Project structure

```
EcommerceUI/
└── lib/
    ├── main.dart                 # App entry + scaffold with bottom navigation
    └── pages/
        ├── splash/index.dart     # Session check → route
        ├── auth/
        │   ├── login/index.dart      # Sign in (shared_preferences)
        │   └── register/index.dart   # Sign up (shared_preferences)
        ├── home/index.dart       # Product catalogue
        ├── product/detail/       # Product details
        ├── serach/index.dart     # Search
        ├── cart/index.dart       # Cart list
        └── setting/index.dart    # Settings + logout
```

## Getting started

```bash
# 1. clone the repository
git clone https://github.com/aamirali65/Ecommerce-App-With-SharedPreferences.git
cd Ecommerce-App-With-SharedPreferences/EcommerceUI

# 2. install dependencies
flutter pub get

# 3. run it
flutter run            # pick a device / chrome
```

Requirements: [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.x (Dart 3).

### Try the auth flow

1. Launch the app → Splash → **Sign up** page (first run)
2. Register with a name, email and password
3. Sign in with the same credentials → Home page
4. Kill and reopen the app → you land straight on the **Home** page
5. **Settings → Log Out** → back to the login screen

## Running checks

```bash
flutter analyze
flutter test
```

## Roadmap

- [ ] Connect a real REST API instead of local-only auth
- [ ] Encrypt stored credentials (e.g. `flutter_secure_storage`)
- [ ] Persist the cart and wishlist
- [ ] State management (Provider / Riverpod / Bloc)
- [ ] Product images from an API and real product data

## Contributing

Issues and pull requests are welcome. For major changes, open an issue first to discuss
what you would like to change.

## Author

**Aamir Ali** — [github.com/aamirali65](https://github.com/aamirali65)
