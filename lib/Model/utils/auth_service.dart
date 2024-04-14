import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/data/portfolio.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  late Realm _realm;
  late RealmResults<Portfolio> _portfolios;
  late CreatePortfolio _createportfolio;
  late RealmResults<CreateStock> _createStocks;
  late RealmResults<CreateETF> _createETFs;
  late RealmResults<CreateBond> _createBonds;
  late Profile _profile;
  late User _user;
  factory AuthService() {
    return _instance;
  }
  AuthService._internal();
  void initialize(User user) {
    _user = user;
    _realm = Realm(Configuration.flexibleSync(user, [
      Portfolio.schema,
      Profile.schema,
      CreateStock.schema,
      CreateETF.schema,
      CreateBond.schema,
      CreatePortfolio.schema
    ]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
      mutableSubscriptions.add(_realm.all<CreatePortfolio>());
      mutableSubscriptions.add(_realm.all<CreateStock>());
      mutableSubscriptions.add(_realm.all<CreateETF>());
      mutableSubscriptions.add(_realm.all<CreateBond>());
    });

    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _createportfolio =
        _realm.query<CreatePortfolio>('userId == \$0', [user.id]).first;
    _createStocks = _realm.query<CreateStock>('userId == \$0', [user.id]);
    _createETFs = _realm.query<CreateETF>('userId == \$0', [user.id]);
    _createBonds = _realm.query<CreateBond>('userId == \$0', [user.id]);
    _profile = _realm.query<Profile>('userId == \$0', [user.id]).first;
  }

  void initializefirstTime(User user, String username) {
    _user = user;
    _realm = Realm(Configuration.flexibleSync(user, [
      Portfolio.schema,
      Profile.schema,
      CreateStock.schema,
      CreateETF.schema,
      CreateBond.schema,
      CreatePortfolio.schema
    ]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
      mutableSubscriptions.add(_realm.all<CreatePortfolio>());
      mutableSubscriptions.add(_realm.all<CreateStock>());
      mutableSubscriptions.add(_realm.all<CreateETF>());
      mutableSubscriptions.add(_realm.all<CreateBond>());
    });
    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _createportfolio =
        _realm.query<CreatePortfolio>('userId == \$0', [user.id]).first;
    _createStocks = _realm.query<CreateStock>('userId == \$0', [user.id]);
    _createETFs = _realm.query<CreateETF>('userId == \$0', [user.id]);
    _createBonds = _realm.query<CreateBond>('userId == \$0', [user.id]);
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

  CreatePortfolio getCreatePortfolio() {
    _createportfolio = _createportfolio =
        _realm.query<CreatePortfolio>('userId == \$0', [_user.id]).first;
    return _createportfolio;
  }

  RealmResults<CreateStock> getCreateStocks() {
    _createStocks = _realm.query<CreateStock>('userId == \$0', [_user.id]);
    return _createStocks;
  }

  RealmResults<CreateETF> getCreateETFs() {
    _createETFs = _realm.query<CreateETF>('userId == \$0', [_user.id]);
    return _createETFs;
  }

  RealmResults<CreateBond> getCreateBonds() {
    _createBonds = _realm.query<CreateBond>('userId == \$0', [_user.id]);
    return _createBonds;
  }

  Profile getProfile() {
    return _profile;
  }
}
