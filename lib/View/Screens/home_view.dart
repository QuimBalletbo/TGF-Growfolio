import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/home_view_component/home_view_part.dart';
import 'package:flutter_application_1/View/widgets/custom_bottom_bar.dart';
import 'package:flutter_application_1/View/Screens/profile_view_component/profile_view_part.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/listBloc.dart';
import 'package:flutter_application_1/Model/data/portfolio.dart';
import 'package:flutter_application_1/Model/itemBloc.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
          return PGinaDIniciAlumneOnePage(bloc: bloc, singlebloc: singlebloc);
        },
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 0, // Set the index of the Home tab
        onChanged: (type) {
          Navigator.pushNamed(context, AppRoutes.profileContainerScreen);
        },
      ),
    );
  }
}
