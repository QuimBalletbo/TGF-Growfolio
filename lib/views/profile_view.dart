import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/views/home_view_component/home_view_part.dart';
import 'package:flutter_application_1/widgets/custom_bottom_bar.dart';
import 'package:flutter_application_1/views/profile_view_component/profile_view_part.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/views/components/listBloc.dart';
import 'package:flutter_application_1/core/data/portfolio.dart';
import 'package:flutter_application_1/views/components/itemBloc.dart';
import 'package:flutter_application_1/core/utils/auth_service.dart';

class ProfileContainerScreen extends StatelessWidget {
  ProfileContainerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final portfolios = AuthService().getPortfolios();
    final user = AuthService().getUser();
    final Realm _realm = portfolios.realm; // Get the realm from portfolios
    final bloc = ListBloc(portfolios: portfolios, realm: _realm, user: user);
    final singlebloc = ItemBloc(realm: _realm);
    return Scaffold(
      backgroundColor: appTheme.gray100,
      body: StreamBuilder(
        stream: bloc.portfolios.changes,
        builder: (context, snapshot) {
          return ProfileOneScreen(bloc: bloc, singlebloc: singlebloc);
        },
      ), // Use your ProfilePage widget here
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
