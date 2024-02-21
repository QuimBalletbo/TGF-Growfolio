import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_part.dart';
import 'package:flutter_application_1/widgets/custom_bottom_bar.dart';
import 'package:flutter_application_1/views/profile_view_component/profile_view_part.dart';

// ignore_for_file: must_be_immutable
class PGinaDIniciAlumneOneContainerScreen extends StatelessWidget {
  const PGinaDIniciAlumneOneContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: PGinaDIniciAlumneOnePage(),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 0, // Set the index of the Home tab
        onChanged: (type) {
          Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
        },
      ),
    );
  }
}
