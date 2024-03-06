import 'package:realm/realm.dart';
import 'package:flutter_application_1/core/data/portfolio.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  late final Realm _realm;
  late final RealmResults<Portfolio> _portfolios;
  late final User _user;
  factory AuthService() {
    return _instance;
  }
  AuthService._internal();
  void initialize(User user) {
    _user = user;
    _realm = Realm(Configuration.flexibleSync(user, [Portfolio.schema]));
    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);

    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
    });
  }

  User getUser() {
    return _user; // Return the current user
  }

  RealmResults<Portfolio> getPortfolios() {
    return _portfolios;
  }
}
