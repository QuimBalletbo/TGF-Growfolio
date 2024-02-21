import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_part.dart';
import 'package:flutter_application_1/widgets/custom_bottom_bar.dart';
import 'package:flutter_application_1/views/profile_view_component/profile_view_part.dart';

class ProfileContainerScreen extends StatelessWidget {
  const ProfileContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: ProfileOneScreen(), // Use your ProfilePage widget here
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 1, // Set the index of the Profile tab
        onChanged: (type) {
          Navigator.pushNamed(
              context, AppRoutes.pGinaDIniciAlumneOneContainerScreen);
        },
      ),
    );
  }
}
