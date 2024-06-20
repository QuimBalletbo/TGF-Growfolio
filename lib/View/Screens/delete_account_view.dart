import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/delete_my_account_dialog.dart';
import 'package:realm/realm.dart';

// ignore_for_file: must_be_immutable
class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({Key? key, required this.app}) : super(key: key);

  final App app;

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
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                      style: CustomTextStyles.displayMediumLight,
                    ),
                  ),
                ),
                SizedBox(height: 32.v),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.59),
                  child: DeleteMyAccountDialog(app: app),
                ),

                // Form Content
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the pGinaDIniciAlumneOneContainerScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }
}
