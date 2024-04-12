import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';

class ListCreatePortfolio {
  final RealmResults<CreatePortfolio> portfolios;
  final Realm _realm;
  final User user;

  ListCreatePortfolio(
      {required this.user, required this.portfolios, required Realm realm})
      : _realm = realm;
}

class PortfolioBloc {
  final Realm _realm;
  PortfolioBloc({required Realm realm}) : _realm = realm;

  void deleteItem(CreatePortfolio portfolio) {
    _realm.write(() => _realm.delete(portfolio));
  }
}
