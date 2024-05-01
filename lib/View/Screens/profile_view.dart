import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/widgets/custom_bottom_bar.dart';
import 'package:flutter_application_1/View/Screens/profile_view_component/profile_view_part.dart';

class ProfileContainerScreen extends StatelessWidget {
  ProfileContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: ProfileOneScreen(), // Use your ProfileOneScreen widget directly
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 1, // Set the index of the Profile tab
        onChanged: (type) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeScreen,
            (route) => false,
          );
        },
      ),
    );
  }
}
