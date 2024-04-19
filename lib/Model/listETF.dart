import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';

class ListETF {
  final RealmResults<CreateETF> etfs;
  final Realm _realm;
  final User user;

  ListETF({required this.user, required this.etfs, required Realm realm})
      : _realm = realm;
}

class ETFBloc {
  final Realm _realm;
  ETFBloc({required Realm realm}) : _realm = realm;

  void deleteItem(CreateETF etf) {
    _realm.write(() => _realm.delete(etf));
  }
}
