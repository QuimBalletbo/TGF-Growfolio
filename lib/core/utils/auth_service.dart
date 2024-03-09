import 'package:flutter_application_1/core/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/core/data/portfolio.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  late Realm _realm;
  late RealmResults<Portfolio> _portfolios;
  late Profile _profile;
  late User _user;
  factory AuthService() {
    return _instance;
  }
  AuthService._internal();
  void initialize(User user) {
    _user = user;
    _realm = Realm(
        Configuration.flexibleSync(user, [Portfolio.schema, Profile.schema]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
    });

    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _profile = _realm.query<Profile>('userId == \$0', [user.id]).first;
  }

  void initializefirstTime(User user, String username) {
    _user = user;
    _realm = Realm(
        Configuration.flexibleSync(user, [Portfolio.schema, Profile.schema]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
    });

    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _realm.write(() => _realm.add(
          Profile(
              ObjectId(), username, user.id, 0, 'none', 'none', 'none', 'none'),
        ));
    _profile = _realm.query<Profile>('userId == \$0', [user.id]).first;
  }

  User getUser() {
    return _user; // Return the current user
  }

  Realm getRealm() {
    return _realm;
  }

  RealmResults<Portfolio> getPortfolios() {
    return _portfolios;
  }

  Profile getProfile() {
    return _profile;
  }
}
