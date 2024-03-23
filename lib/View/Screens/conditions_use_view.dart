import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/conditions_use_dialog.dart';

// ignore_for_file: must_be_immutable
class ConditionsUseScreen extends StatelessWidget {
  ConditionsUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            ImageConstant.imgconfigurationBackground,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Conditions of use and privacy policies",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayMediumLight.copyWith(
                        fontSize: 36.0, // Change the font size as needed
                      ),
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
            bottom: 28,
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *
                        0.7), // Set maximum height as needed
                child: AlertDialog(
                  content: ConditionsUseDialog(),
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  insetPadding: const EdgeInsets.only(left: 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
