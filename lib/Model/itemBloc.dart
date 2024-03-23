import 'package:flutter_application_1/Model/data/portfolio.dart';
import 'package:realm/realm.dart';

class ItemBloc {
  final Realm _realm;
  ItemBloc({required Realm realm}) : _realm = realm;

  void deleteItem(Portfolio portfolio) {
    _realm.write(() => _realm.delete(portfolio));
  }
}
