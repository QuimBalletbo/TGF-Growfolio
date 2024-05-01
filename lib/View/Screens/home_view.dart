import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_part.dart';
import 'package:flutter_application_1/View/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: PGinaDIniciAlumneOnePage(), // Use the widget directly
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 0, // Set the index of the Home tab
        onChanged: (type) {
          Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
        },
      ),
    );
  }
}
