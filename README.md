# Financial Portfolio Management Application in Flutter

A new Flutter project for managing financial portfolios.

## Getting Started

This project is a Financial Portfolio Management Application built using Flutter. The application allows users to manage their financial portfolios, simulate portfolio performance, and assess the performance of their assets. It integrates a public API and uses MongoDB Realm as the database.

### Features

- **User Authentication**: Secure user login and management.
- **Portfolio Management**: Users can create, manage, and simulate different portfolios.
- **Performance Simulation**: Simulate and calculate the performance of portfolios.
- **Security and Privacy**: Ensures user data privacy and security.

### Technologies Used

- **Flutter**: For building the cross-platform mobile application.
- **MongoDB Realm**: For database management.
- **Figma**: For designing the user interface.
- **Public API**: Integrated for data retrieval and interaction.

### Usage

- After launching the application, users can sign up or log in.
- Users can create and manage their financial portfolios.
- The application provides options to simulate portfolio performance and assess the results.
- Use the navigation menu to access different sections of the app.


## Project Setup

To set up and run this Flutter project locally, follow these steps:

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version >=2.15.0 <3.0.0)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) (recommended for development)
- An Android/iOS device or emulator for testing

### 1. Clone the Repository

```
git clone <repository-url>
cd TGF-Growfolio
```

### 2. Install Dependencies

Run the following command to fetch all required packages:

```
flutter pub get
```

### 3. Configure Assets

Ensure the assets and fonts listed in `pubspec.yaml` are present in the `assets/` directory. No manual configuration is needed if you use the provided structure.

### 4. Run the Application

To launch the app on an emulator or connected device, use:

```
flutter run
```

### 5. Additional Notes

- For Android/iOS builds, ensure you have the appropriate SDKs and emulators installed.
- The app uses MongoDB Realm and a public API; ensure you have internet access for full functionality.
- If you encounter issues, try running `flutter clean` and then `flutter pub get` again.

---

## Project Structure

- **lib/**: Contains the main Flutter codebase.
  - **main.dart**: Entry point of the application.
  - **Model/**: Contains the data models and business logic used within the application.
  - **View/**: Contains the UI screens, widgets, and design elements of the application.
  - **Controller/**: Contains the logic that connects the Model and View, handling user input and updating the UI accordingly.

## Contact Information

For questions, feedback, or collaboration opportunities, feel free to contact at joaquim.balletbo.galan@gmail.com.
