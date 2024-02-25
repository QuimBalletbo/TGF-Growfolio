import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/components/password_dialog.dart';

// ignore_for_file: must_be_immutable
class PasswordScreen extends StatelessWidget {
  PasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            ImageConstant.imgPasswordSecurity,
            fit: BoxFit.fill, // Ensure the image fills the entire screen
          ),
          // Dark overlay
          Container(
            color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
          ),
          // Content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBar
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  // Add your appbar actions here
                ),

                Center(
                  child: Container(
                    width: double
                        .infinity, // Ensure the container takes up the full width
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Password & Security",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayMediumLight,
                    ),
                  ),
                ),
                SizedBox(height: 32.v),
                // Form Content
              ],
            ),
          ),
          // AlertDialog
          Positioned(
            left: 15,
            right: 15,
            bottom: 88,
            child: Center(
              child: AlertDialog(
                content: PasswordSecurityDialog(),
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                insetPadding: const EdgeInsets.only(left: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
