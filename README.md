# Flutter Tic-Tac-Toe

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)

A modern implementation of the classic Tic-Tac-Toe game built with Flutter, featuring a clean Material Design 3 UI and theme support.

## Features

- 🎮 Classic Tic-Tac-Toe gameplay
- 🌗 Light and dark theme support
- 🎨 Material Design 3 with custom color schemes
- 📱 Responsive design for various screen sizes
- 🔄 State management using Provider

## Project Structure

```
lib/
├── app.dart              # Main app configuration and theme setup
├── main.dart            # Entry point and provider setup
├── pages/              # Screen implementations
├── providers/          # State management
└── widgets/           # Reusable UI components
```

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/vinaysarupuru/flutter_tic_tac_toe.git
```

2. Navigate to project directory:
```bash
cd flutter_tic_tac_toe
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Architecture

The app follows a clean architecture pattern with:
- Providers for state management
- Separated business logic from UI
- Themed components for consistent design
- Modular widget structure

## Contributing

We welcome contributions to make this project better! Here's how you can help:

### Bug Reports and Feature Requests

- Use the GitHub issue tracker to report bugs
- Clearly describe the issue/feature including steps to reproduce
- Make sure to check existing issues before creating new ones

### Development Process

1. Fork the repository
2. Create a new branch for your feature (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add or update tests as needed
5. Run tests and ensure they pass
6. Commit your changes (`git commit -m 'Add some amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

### Code Style

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Run `flutter analyze` before submitting PRs
- Write meaningful commit messages
- Keep code clean and well-documented

### Pull Request Process

1. Update the README.md with details of changes if needed
2. Ensure any install or build dependencies are removed before the end build
3. Update documentation as needed
4. Your PR will be reviewed by maintainers

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Flutter team for the amazing framework
- The open source community for inspiration
- All contributors who help improve this project
