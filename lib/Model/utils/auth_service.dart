import 'package:flutter_application_1/Model/data/profile.dart';
import 'package:realm/realm.dart';
import 'package:flutter_application_1/Model/data/portfolio.dart';
import 'package:flutter_application_1/Model/data/createPortfolio.dart';
import 'package:flutter_application_1/Model/data/portfolioReturn.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  late Realm _realm;
  late RealmResults<Portfolio> _portfolios;
  late CreatePortfolio _createportfolio;
  late RealmResults<CreateStock> _createStocks;
  late RealmResults<CreateETF> _createETFs;
  late RealmResults<CreateBond> _createBonds;
  late RealmResults<PortfolioReturn> _portfolioReturn;
  late PortfolioReturn _singleportfolioReturn;
  late RealmResults<AssetReturn> _assetReturn;
  late AssetReturn _singleassetReturn;
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
      CreatePortfolio.schema,
      PortfolioReturn.schema,
      AssetReturn.schema
    ]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
      mutableSubscriptions.add(_realm.all<CreatePortfolio>());
      mutableSubscriptions.add(_realm.all<CreateStock>());
      mutableSubscriptions.add(_realm.all<CreateETF>());
      mutableSubscriptions.add(_realm.all<CreateBond>());
      mutableSubscriptions.add(_realm.all<PortfolioReturn>());
      mutableSubscriptions.add(_realm.all<AssetReturn>());
    });
    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _createportfolio =
        _realm.query<CreatePortfolio>('userId == \$0', [user.id]).first;
    _createStocks = _realm.query<CreateStock>('userId == \$0', [user.id]);
    _createETFs = _realm.query<CreateETF>('userId == \$0', [user.id]);
    _createBonds = _realm.query<CreateBond>('userId == \$0', [user.id]);

    _profile = _realm.query<Profile>('userId == \$0', [user.id]).first;

    _portfolioReturn =
        _realm.query<PortfolioReturn>('userId == \$0', [user.id]);
    _assetReturn = _realm.query<AssetReturn>('userId == \$0', [user.id]);
  }

  void initializefirstTime(User user, String username) {
    _user = user;
    _realm = Realm(Configuration.flexibleSync(user, [
      Portfolio.schema,
      Profile.schema,
      CreateStock.schema,
      CreateETF.schema,
      CreateBond.schema,
      CreatePortfolio.schema,
      PortfolioReturn.schema,
      AssetReturn.schema
    ]));
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(_realm.all<Portfolio>());
      mutableSubscriptions.add(_realm.all<Profile>());
      mutableSubscriptions.add(_realm.all<CreatePortfolio>());
      mutableSubscriptions.add(_realm.all<CreateStock>());
      mutableSubscriptions.add(_realm.all<CreateETF>());
      mutableSubscriptions.add(_realm.all<CreateBond>());
      mutableSubscriptions.add(_realm.all<PortfolioReturn>());
      mutableSubscriptions.add(_realm.all<AssetReturn>());
    });
    _portfolios = _realm.query<Portfolio>('userId == \$0', [user.id]);
    _realm.write(() => _realm.add(
          CreatePortfolio(
              ObjectId(),
              0,
              0,
              0,
              false,
              0,
              0,
              '',
              '',
              '',
              0,
              '',
              0,
              false,
              false,
              false,
              0,
              '',
              false,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              false,
              user.id),
        ));
    _createportfolio =
        _realm.query<CreatePortfolio>('userId == \$0', [user.id]).first;
    _createStocks = _realm.query<CreateStock>('userId == \$0', [user.id]);
    _createETFs = _realm.query<CreateETF>('userId == \$0', [user.id]);
    _createBonds = _realm.query<CreateBond>('userId == \$0', [user.id]);
    ObjectId objectId = ObjectId();
    _realm.write(() => _realm.add(
          Profile(ObjectId(), username, user.id, 0, 'none', 'none', 'none',
              'none', objectId),
        ));
    _profile = _realm.query<Profile>('userId == \$0', [user.id]).first;
    _portfolioReturn =
        _realm.query<PortfolioReturn>('userId == \$0', [user.id]);
    _assetReturn = _realm.query<AssetReturn>('userId == \$0', [user.id]);
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

  RealmResults<PortfolioReturn> getPortfoliosReturn() {
    _portfolioReturn =
        _realm.query<PortfolioReturn>('userId == \$0', [_user.id]);
    return _portfolioReturn;
  }

  PortfolioReturn getsinglePortfolioReturn(ObjectId idPortfolio) {
    _singleportfolioReturn =
        _realm.query<PortfolioReturn>('id == \$0', [idPortfolio]).first;
    return _singleportfolioReturn;
  }

  RealmResults<AssetReturn> getAssetReturn() {
    _assetReturn = _realm.query<AssetReturn>('userId == \$0', [_user.id]);
    return _assetReturn;
  }

  AssetReturn getsingleAssetReturn(ObjectId idAsset) {
    _singleassetReturn =
        _realm.query<AssetReturn>('id == \$0', [idAsset]).first;
    return _singleassetReturn;
  }

  CreatePortfolio getCreatePortfolio() {
    _createportfolio =
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
    _profile = _realm.query<Profile>('userId == \$0', [_user.id]).first;
    return _profile;
  }
}
