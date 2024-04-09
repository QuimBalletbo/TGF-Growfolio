import 'package:realm/realm.dart';
part 'createPortfolio.g.dart';

@RealmModel()
class _CreateStock {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String name;
  late bool fwt;
  late int stockAllocation;
  late double avgReturn;
  late double avgDividend;
}

@RealmModel()
class _CreateETF {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String name;
  late bool fwt;
  late int eTFAllocation;
  late double avgReturn;
  late double avgDividend;
  late double expRatio;
}

@RealmModel()
class _CreateBond {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String name;
  late bool fwt;
  late int bondAllocation;
  late double couponRate;
  late double faceValue;
  late double maturityPeriod;
}

@RealmModel()
class _CreatePortfolio {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String userId;
  late String name;
  late int duration;
  late double monetaryObjective;
  late String frequencyInvesting;
  late bool taxation;
  late bool brokerFees;
  late bool rebalancing;
  late double taxRateShortTerm;
  late double taxRateLongTerm;
  late int shortToLongTransition;
  late double dividendTax;
  late double fwt;
  late double stockPurchaseFee;
  late double stockPurchaseFlatFee;
  late double stockSaleFee;
  late double stockSaleFlatFee;
  late double accountMaintenanceFee;
  late double accountMaintenanceFlatFee;
  late bool includeStocks;
  late bool includeETF;
  late bool includeBonds;
  late double stockAllocationPercentage;
  late double etfAllocationPercentage;
  late double bondAllocationPercentage;

  late List<_CreateStock> stocks;
  late List<_CreateETF> etfs;
  late List<_CreateBond> bonds;
}
