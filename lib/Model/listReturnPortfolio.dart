import 'package:flutter_application_1/Model/data/portfolioReturn.dart';
import 'package:realm/realm.dart';

class ListReturnPortfolio {
  final RealmResults<PortfolioReturn> portfolios;
  final Realm _realm;
  final User user;

  ListReturnPortfolio(
      {required this.user, required this.portfolios, required Realm realm})
      : _realm = realm;
}

class ReturnPortfolioBloc {
  final Realm _realm;
  ReturnPortfolioBloc({required Realm realm}) : _realm = realm;

  void deleteItem(PortfolioReturn portfolio) {
    _realm.write(() => _realm.delete(portfolio));
  }
}
