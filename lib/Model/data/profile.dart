import 'package:realm/realm.dart';
part 'profile.g.dart';

@RealmModel()
class _Profile {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String userName;
  late String userId;
  late int portfolionum;
  late String preferedAssetclass;
  late String bestPerformingPortfolio;
  late String riskiestPortfolio;
  late String bestPortfolio;
  late ObjectId selectedPortfolio;
}
