import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/core/data/portfolio.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  final realm = Realm(Configuration.local([Portfolio.schema]));
  final allPortfolios = realm.all<Portfolio>();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp(portfolios: allPortfolios));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.portfolios}) : super(key: key);
  final RealmResults<Portfolio> portfolios;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Growfolio',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.iniciarSessiRegistrarSeScreen,
          routes: AppRoutes.routes(portfolios),
        );
      },
    );
  }
}
