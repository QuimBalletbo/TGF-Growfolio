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
  try {
    final user = await app.logIn(Credentials.emailPassword(
        "joaquim.balletbo@students.salle.url.edu", "qwert1234"));
    final realm = Realm(Configuration.flexibleSync(user, [Portfolio.schema]));
    final allPortfolios = realm.all<Portfolio>();

    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Portfolio>());
    });
    AuthService.initializeApp(app);
    ;

    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    ///Please update theme as per your need if required.
    ThemeHelper().changeTheme('primary');
    print(
        "Successful logging in: User id: ${user.id} User id: ${user.profile}");
    runApp(MyApp(portfolios: allPortfolios));
  } catch (e) {
    print("Error logging in: $e");
  }
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
