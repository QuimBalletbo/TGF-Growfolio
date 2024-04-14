import 'package:realm/realm.dart';
part 'createPortfolio.g.dart';

@RealmModel()
class _CreateStock {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late double avgDividend;
  late double avgReturn;
  late bool fwt;
  late String name;
  late int stockAllocation;
  late String userId;
}

@RealmModel()
class _CreateETF {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late double avgDividend;
  late double avgReturn;
  late int eTFAllocation;
  late double expRatio;
  late bool fwt;
  late String name;
  late String userId;
}

@RealmModel()
class _CreateBond {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late int bondAllocation;
  late double couponRate;
  late double faceValue;
  late bool fwt;
  late double maturityPeriod;
  late String name;
  late String userId;
}

@RealmModel()
class _CreatePortfolio {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late double accountMaintenanceFee;
  late double accountMaintenanceFlatFee;
  late double bondAllocationPercentage;
  late List<_CreateBond> bonds;
  late bool brokerFees;
  late double dividendTax;
  late int duration;
  late String equalWeightBonds;
  late String equalWeightETFs;
  late String equalWeightStocks;
  late double etfAllocationPercentage;
  late List<_CreateETF> etfs;
  late String frequencyInvesting;
  late double fwt;
  late bool includeBonds;
  late bool includeETF;
  late bool includeStocks;
  late double monetaryObjective;
  late String name;
  late bool rebalancing;
  late int shortToLongTransition;
  late double stockAllocationPercentage;
  late double stockPurchaseFee;
  late double stockPurchaseFlatFee;
  late double stockSaleFee;
  late double stockSaleFlatFee;
  late List<_CreateStock> stocks;
  late double taxRateLongTerm;
  late double taxRateShortTerm;
  late bool taxation;
  late String userId;
}
