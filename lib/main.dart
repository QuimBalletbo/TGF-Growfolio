import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/app_export.dart';
import 'package:flutter_application_1/core/data/portfolio.dart';
import 'package:realm/realm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/core/utils/auth_service.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  final app = App(AppConfiguration('growfolio-jnlhw'));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');

  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.app}) : super(key: key);
  final App app;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Growfolio',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.iniciarSessiRegistrarSeScreen,
          routes: AppRoutes.routes(app),
        );
      },
    );
  }
}
