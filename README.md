# Kunal Manocha - Personal Portfolio

A professional, responsive personal portfolio application built with **Flutter**. This project showcases my skills, experience, projects, and education in a clean, interactive, and modern user interface.

## 🌟 Key Features

*   **Responsive Design**: optimized for Web, Mobile, and Desktop using a custom `ResponsiveWidget`.
*   **Clean Architecture**: Implemented using the **BLoC (Business Logic Component)** pattern for scalable and testable state management.
*   **Dynamic Theming**: Full **Dark and Light mode** support with persistent state.
*   **Cloud Integration**: Powered by **Firebase** (Firestore for dynamic data content and Storage for assets like CVs).
*   **Interactive UI**: Includes animations using `animated_text_kit`, hover effects, and smooth scrolling.
*   **Modular Codebase**: Code is structured into feature-based modules (Personal, Projects, Experience, etc.) for better maintainability.

## 🛠️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/) (Dart)
*   **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
*   **Backend**: 
    *   [Cloud Firestore](https://firebase.google.com/docs/firestore) (Data)
    *   [Firebase Storage](https://firebase.google.com/docs/storage) (Assets)
*   **Typography**: [google_fonts](https://pub.dev/packages/google_fonts)
*   **Animations**: [animated_text_kit](https://pub.dev/packages/animated_text_kit)
*   **Routing**: Named routes and simple navigation.

## 📂 Project Structure

The project follows a feature-first structure inside the `lib/` directory:

```
lib/
├── components/          # Reusable UI widgets (AppButtons, ResponsiveWidget, etc.)
├── modules/             # Feature modules
│   ├── contact/         # Contact Me section & BLoC
│   ├── education/       # Education timeline
│   ├── experience/      # Work experience timeline
│   ├── getInTouch/      # Contact form dialog
│   ├── home/            # Main landing page & Layout
│   ├── personal/        # Hero section & Personal overview
│   ├── projects/        # Project showcase
│   ├── techStack/       # Skills & Technologies
│   └── theme/           # Theme switching logic
├── utils/               # Utilities, Constants, AppColors, TextStyles
├── main.dart            # Entry point & BLoC providers setup
└── firebase_options.dart # Firebase configuration
```

## 🚀 Getting Started

### Prerequisites

*   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
*   [Firebase CLI](https://firebase.google.com/docs/cli) (if you plan to reconfigure firebase).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/my-portfolio.git
    cd my-portfolio
    ```

2.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Firebase Configuration (Optional):**
    This project uses `flutterfire`. If you want to connect it to your own Firebase project:
    ```bash
    flutterfire configure
    ```

4.  **Run the App:**
    *   **For Web:**
        ```bash
        flutter run -d chrome
        ```
    *   **For Mobile (Android/iOS):**
        ```bash
        flutter run
        ```

## 🎨 Theming

The app supports both Light and Dark themes. The theme state is managed by `ThemeBloc` and can be toggled via the floating action button on the home screen.
*   **Colors**: Defined in `lib/utils/app_colors.dart`.
*   **TextStyles**: Dynamic styles depending on the active theme context in `lib/utils/text_styles.dart`.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
