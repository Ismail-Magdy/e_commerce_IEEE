# E-Commerce App

A modern Flutter e-commerce application built with clean architecture principles.

## 📱 Features

- **User Authentication**: Secure login and signup with avatar support
- **Product Browsing**: Browse products by categories
- **Shopping Cart**: Add/remove items from cart
- **User Profile**: Manage user information and preferences
- **Clean Architecture**: Well-organized project structure with separation of concerns

## 🏗️ Project Structure

```
lib/
├── main.dart
├── core/
│   ├── helpers/
│   └── theme/
└── features/
    ├── auth/                 # Authentication (login, signup)
    ├── home/                 # Home screen
    ├── categories/           # Product categories
    ├── cart/                 # Shopping cart
    ├── profile/              # User profile
    └── main_wrapper/         # App wrapper/navigation
```

## 🔐 Authentication

- **Login**: Email and password-based authentication
- **Signup**: Create account with name, email, password, and avatar URL
- **Password Requirements**: Minimum 4 characters
- **Avatar**: Must be a valid HTTPS/HTTP URL

### Signup Example

```json
{
  "name": "Nicolas",
  "email": "nico@gmail.com",
  "password": "1234",
  "avatar": "https://api.lorem.space/image/face?w=640&h=480"
}
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK

### Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd e_commerce_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## 📚 API Integration

The app uses the Escuelajs API for backend services:

- **Base URL**: https://api.escuelajs.co/api/v1/
- **Endpoints**:
  - Login: `auth/login`
  - Signup: `users/`

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Dart**: Programming language
- **HTTP**: For API calls
- **Material Design**: UI components

## 📝 License

This project is licensed under the MIT License.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests.

## 📞 Support

For support, please open an issue on the repository.
