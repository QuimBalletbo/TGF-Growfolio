import 'package:realm/realm.dart';

class AuthService {
  static late App _app;

  // Method to set the app instance from the main
  static void initializeApp(App app) {
    _app = app;
  }

  // Static method to register a user
  static Future<void> registerUser(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
    await authProvider.registerUser(email, password);
  }

  static Future<void> confirmUser(String token, String tokenId) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
    await authProvider.confirmUser(token, tokenId);
  }

  // Other authentication methods...
}
