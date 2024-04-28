import 'package:flutter_application_1/Model/listReturnPortfolio.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/utils/auth_service.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';

class CreatePortfolioValues {
  RealmResults<PortfolioReturn> allPortfolioReturn =
      AuthService().getPortfolioReturn();
  final user = AuthService().getUser();
  final Realm realm = AuthService().getRealm();

  CreatePortfolio returnPortfolio = AuthService().getCreatePortfolio();

  late ReturnPortfolioBloc singlePortfolio = ReturnPortfolioBloc(realm: realm);
  late ListReturnPortfolio allPortfolios = ListReturnPortfolio(
      portfolios: allPortfolioReturn, realm: realm, user: user);
}
