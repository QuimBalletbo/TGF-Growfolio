import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';

class ListStock {
  final RealmResults<CreateStock> stocks;
  final Realm _realm;
  final User user;

  ListStock({required this.user, required this.stocks, required Realm realm})
      : _realm = realm;
}

class StockBloc {
  final Realm _realm;
  StockBloc({required Realm realm}) : _realm = realm;

  void deleteItem(CreateStock stock) {
    _realm.write(() => _realm.delete(stock));
  }
}
