import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';

class ShowReturnView1Controller {
  Profile profile = AuthService().getProfile();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();
  late PortfolioReturn portfolio;
  String portfolioName = '';

  String initViewData() {
    portfolio = realm.query<PortfolioReturn>(
        'userId == \$0', [profile.selectedPortfolio]).first;
    portfolioName = portfolio.name;
    return portfolioName;
  }
}
