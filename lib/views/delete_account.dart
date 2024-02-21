import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/widgets/custom_elevated_button.dart';
import 'package:flutter_application_1/widgets/custom_text_form_field.dart';
import 'package:flutter_application_1/views/components/delete_my_account_dialog.dart';

// ignore_for_file: must_be_immutable
class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({Key? key}) : super(key: key);

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
            ImageConstant.imgDeletemyAcountBackground,
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
                SizedBox(height: 18.v),
                Center(
                  child: Container(
                    width: double
                        .infinity, // Ensure the container takes up the full width
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Delete My Account",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium != null
                          ? theme.textTheme.displayMedium!
                              .copyWith(color: Colors.black)
                          : const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 32.v),
                // Form Content
              ],
            ),
          ),
          // AlertDialog
          Center(
            child: AlertDialog(
              content: DeleteMyAccountDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
  }
}
