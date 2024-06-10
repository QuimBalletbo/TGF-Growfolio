import 'package:realm_dart/realm.dart';
part 'portfolioReturn.g.dart';
// NOTE: These models are private and therefore should be copied into the same .dart file.

@RealmModel()
class _PortfolioReturn {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late double allocationScore;
  late double amountInvested;
  late List<_AssetReturn> assets;
  late double avgReturn;
  late double bondAllocationPercentage;
  late double diversaificationScore;
  late int duration;
  late double durationScore;
  late double etfAllocationPercentage;
  late double finalBondValue;
  late double finalETFValue;
  late double finalStockValue;
  late double finalportfolioValue;
  late String frequencyInvesting;
  late String name;
  late double returnScore;
  late int score;
  late double stockAllocationPercentage;
  @MapTo('user_id')
  late String userId;
}

@RealmModel()
class _AssetReturn {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late double finalValue;

  late double monthlyInvestment;

  late String name;

  late double totalInvestment;

  @MapTo('user_id')
  late String userId;
}
