import 'package:flutter_application_1/core/data/portfolio.dart';
import 'package:realm/realm.dart';

class ListBloc {
  final RealmResults<Portfolio> portfolios;
  final Realm _realm;

  ListBloc({required this.portfolios, required Realm realm}) : _realm = realm;

  void addNewItems() {
    _realm.write(() => _realm
        .add(Portfolio(ObjectId(), 1 + (portfolios.lastOrNull?.no ?? 0))));
  }
}
