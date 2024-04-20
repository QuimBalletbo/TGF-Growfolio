import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:realm/realm.dart';

class ListBond {
  final RealmResults<CreateBond> bonds;
  final Realm _realm;
  final User user;

  ListBond({required this.user, required this.bonds, required Realm realm})
      : _realm = realm;
}

class BondBloc {
  final Realm _realm;
  BondBloc({required Realm realm}) : _realm = realm;

  void deleteItem(CreateBond bond) {
    _realm.write(() => _realm.delete(bond));
  }
}
