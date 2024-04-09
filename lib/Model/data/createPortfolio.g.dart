// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createPortfolio.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CreateStock extends _CreateStock
    with RealmEntity, RealmObjectBase, RealmObject {
  CreateStock(
    ObjectId id,
    String name,
    bool fwt,
    int stockAllocation,
    double avgReturn,
    double avgDividend,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'fwt', fwt);
    RealmObjectBase.set(this, 'stockAllocation', stockAllocation);
    RealmObjectBase.set(this, 'avgReturn', avgReturn);
    RealmObjectBase.set(this, 'avgDividend', avgDividend);
  }

  CreateStock._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get fwt => RealmObjectBase.get<bool>(this, 'fwt') as bool;
  @override
  set fwt(bool value) => RealmObjectBase.set(this, 'fwt', value);

  @override
  int get stockAllocation =>
      RealmObjectBase.get<int>(this, 'stockAllocation') as int;
  @override
  set stockAllocation(int value) =>
      RealmObjectBase.set(this, 'stockAllocation', value);

  @override
  double get avgReturn =>
      RealmObjectBase.get<double>(this, 'avgReturn') as double;
  @override
  set avgReturn(double value) => RealmObjectBase.set(this, 'avgReturn', value);

  @override
  double get avgDividend =>
      RealmObjectBase.get<double>(this, 'avgDividend') as double;
  @override
  set avgDividend(double value) =>
      RealmObjectBase.set(this, 'avgDividend', value);

  @override
  Stream<RealmObjectChanges<CreateStock>> get changes =>
      RealmObjectBase.getChanges<CreateStock>(this);

  @override
  CreateStock freeze() => RealmObjectBase.freezeObject<CreateStock>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CreateStock._);
    return const SchemaObject(
        ObjectType.realmObject, CreateStock, 'CreateStock', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('fwt', RealmPropertyType.bool),
      SchemaProperty('stockAllocation', RealmPropertyType.int),
      SchemaProperty('avgReturn', RealmPropertyType.double),
      SchemaProperty('avgDividend', RealmPropertyType.double),
    ]);
  }
}

class CreateETF extends _CreateETF
    with RealmEntity, RealmObjectBase, RealmObject {
  CreateETF(
    ObjectId id,
    String name,
    bool fwt,
    int eTFAllocation,
    double avgReturn,
    double avgDividend,
    double expRatio,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'fwt', fwt);
    RealmObjectBase.set(this, 'eTFAllocation', eTFAllocation);
    RealmObjectBase.set(this, 'avgReturn', avgReturn);
    RealmObjectBase.set(this, 'avgDividend', avgDividend);
    RealmObjectBase.set(this, 'expRatio', expRatio);
  }

  CreateETF._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get fwt => RealmObjectBase.get<bool>(this, 'fwt') as bool;
  @override
  set fwt(bool value) => RealmObjectBase.set(this, 'fwt', value);

  @override
  int get eTFAllocation =>
      RealmObjectBase.get<int>(this, 'eTFAllocation') as int;
  @override
  set eTFAllocation(int value) =>
      RealmObjectBase.set(this, 'eTFAllocation', value);

  @override
  double get avgReturn =>
      RealmObjectBase.get<double>(this, 'avgReturn') as double;
  @override
  set avgReturn(double value) => RealmObjectBase.set(this, 'avgReturn', value);

  @override
  double get avgDividend =>
      RealmObjectBase.get<double>(this, 'avgDividend') as double;
  @override
  set avgDividend(double value) =>
      RealmObjectBase.set(this, 'avgDividend', value);

  @override
  double get expRatio =>
      RealmObjectBase.get<double>(this, 'expRatio') as double;
  @override
  set expRatio(double value) => RealmObjectBase.set(this, 'expRatio', value);

  @override
  Stream<RealmObjectChanges<CreateETF>> get changes =>
      RealmObjectBase.getChanges<CreateETF>(this);

  @override
  CreateETF freeze() => RealmObjectBase.freezeObject<CreateETF>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CreateETF._);
    return const SchemaObject(ObjectType.realmObject, CreateETF, 'CreateETF', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('fwt', RealmPropertyType.bool),
      SchemaProperty('eTFAllocation', RealmPropertyType.int),
      SchemaProperty('avgReturn', RealmPropertyType.double),
      SchemaProperty('avgDividend', RealmPropertyType.double),
      SchemaProperty('expRatio', RealmPropertyType.double),
    ]);
  }
}

class CreateBond extends _CreateBond
    with RealmEntity, RealmObjectBase, RealmObject {
  CreateBond(
    ObjectId id,
    String name,
    bool fwt,
    int bondAllocation,
    double couponRate,
    double faceValue,
    double maturityPeriod,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'fwt', fwt);
    RealmObjectBase.set(this, 'bondAllocation', bondAllocation);
    RealmObjectBase.set(this, 'couponRate', couponRate);
    RealmObjectBase.set(this, 'faceValue', faceValue);
    RealmObjectBase.set(this, 'maturityPeriod', maturityPeriod);
  }

  CreateBond._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get fwt => RealmObjectBase.get<bool>(this, 'fwt') as bool;
  @override
  set fwt(bool value) => RealmObjectBase.set(this, 'fwt', value);

  @override
  int get bondAllocation =>
      RealmObjectBase.get<int>(this, 'bondAllocation') as int;
  @override
  set bondAllocation(int value) =>
      RealmObjectBase.set(this, 'bondAllocation', value);

  @override
  double get couponRate =>
      RealmObjectBase.get<double>(this, 'couponRate') as double;
  @override
  set couponRate(double value) =>
      RealmObjectBase.set(this, 'couponRate', value);

  @override
  double get faceValue =>
      RealmObjectBase.get<double>(this, 'faceValue') as double;
  @override
  set faceValue(double value) => RealmObjectBase.set(this, 'faceValue', value);

  @override
  double get maturityPeriod =>
      RealmObjectBase.get<double>(this, 'maturityPeriod') as double;
  @override
  set maturityPeriod(double value) =>
      RealmObjectBase.set(this, 'maturityPeriod', value);

  @override
  Stream<RealmObjectChanges<CreateBond>> get changes =>
      RealmObjectBase.getChanges<CreateBond>(this);

  @override
  CreateBond freeze() => RealmObjectBase.freezeObject<CreateBond>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CreateBond._);
    return const SchemaObject(
        ObjectType.realmObject, CreateBond, 'CreateBond', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('fwt', RealmPropertyType.bool),
      SchemaProperty('bondAllocation', RealmPropertyType.int),
      SchemaProperty('couponRate', RealmPropertyType.double),
      SchemaProperty('faceValue', RealmPropertyType.double),
      SchemaProperty('maturityPeriod', RealmPropertyType.double),
    ]);
  }
}

class CreatePortfolio extends _CreatePortfolio
    with RealmEntity, RealmObjectBase, RealmObject {
  CreatePortfolio(
    ObjectId id,
    String userId,
    String name,
    int duration,
    double monetaryObjective,
    String frequencyInvesting,
    bool taxation,
    bool brokerFees,
    bool rebalancing,
    double taxRateShortTerm,
    double taxRateLongTerm,
    int shortToLongTransition,
    double dividendTax,
    double fwt,
    double stockPurchaseFee,
    double stockPurchaseFlatFee,
    double stockSaleFee,
    double stockSaleFlatFee,
    double accountMaintenanceFee,
    double accountMaintenanceFlatFee,
    bool includeStocks,
    bool includeETF,
    bool includeBonds,
    double stockAllocationPercentage,
    double etfAllocationPercentage,
    double bondAllocationPercentage, {
    Iterable<CreateStock> stocks = const [],
    Iterable<CreateETF> etfs = const [],
    Iterable<CreateBond> bonds = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'monetaryObjective', monetaryObjective);
    RealmObjectBase.set(this, 'frequencyInvesting', frequencyInvesting);
    RealmObjectBase.set(this, 'taxation', taxation);
    RealmObjectBase.set(this, 'brokerFees', brokerFees);
    RealmObjectBase.set(this, 'rebalancing', rebalancing);
    RealmObjectBase.set(this, 'taxRateShortTerm', taxRateShortTerm);
    RealmObjectBase.set(this, 'taxRateLongTerm', taxRateLongTerm);
    RealmObjectBase.set(this, 'shortToLongTransition', shortToLongTransition);
    RealmObjectBase.set(this, 'dividendTax', dividendTax);
    RealmObjectBase.set(this, 'fwt', fwt);
    RealmObjectBase.set(this, 'stockPurchaseFee', stockPurchaseFee);
    RealmObjectBase.set(this, 'stockPurchaseFlatFee', stockPurchaseFlatFee);
    RealmObjectBase.set(this, 'stockSaleFee', stockSaleFee);
    RealmObjectBase.set(this, 'stockSaleFlatFee', stockSaleFlatFee);
    RealmObjectBase.set(this, 'accountMaintenanceFee', accountMaintenanceFee);
    RealmObjectBase.set(
        this, 'accountMaintenanceFlatFee', accountMaintenanceFlatFee);
    RealmObjectBase.set(this, 'includeStocks', includeStocks);
    RealmObjectBase.set(this, 'includeETF', includeETF);
    RealmObjectBase.set(this, 'includeBonds', includeBonds);
    RealmObjectBase.set(
        this, 'stockAllocationPercentage', stockAllocationPercentage);
    RealmObjectBase.set(
        this, 'etfAllocationPercentage', etfAllocationPercentage);
    RealmObjectBase.set(
        this, 'bondAllocationPercentage', bondAllocationPercentage);
    RealmObjectBase.set<RealmList<CreateStock>>(
        this, 'stocks', RealmList<CreateStock>(stocks));
    RealmObjectBase.set<RealmList<CreateETF>>(
        this, 'etfs', RealmList<CreateETF>(etfs));
    RealmObjectBase.set<RealmList<CreateBond>>(
        this, 'bonds', RealmList<CreateBond>(bonds));
  }

  CreatePortfolio._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get duration => RealmObjectBase.get<int>(this, 'duration') as int;
  @override
  set duration(int value) => RealmObjectBase.set(this, 'duration', value);

  @override
  double get monetaryObjective =>
      RealmObjectBase.get<double>(this, 'monetaryObjective') as double;
  @override
  set monetaryObjective(double value) =>
      RealmObjectBase.set(this, 'monetaryObjective', value);

  @override
  String get frequencyInvesting =>
      RealmObjectBase.get<String>(this, 'frequencyInvesting') as String;
  @override
  set frequencyInvesting(String value) =>
      RealmObjectBase.set(this, 'frequencyInvesting', value);

  @override
  bool get taxation => RealmObjectBase.get<bool>(this, 'taxation') as bool;
  @override
  set taxation(bool value) => RealmObjectBase.set(this, 'taxation', value);

  @override
  bool get brokerFees => RealmObjectBase.get<bool>(this, 'brokerFees') as bool;
  @override
  set brokerFees(bool value) => RealmObjectBase.set(this, 'brokerFees', value);

  @override
  bool get rebalancing =>
      RealmObjectBase.get<bool>(this, 'rebalancing') as bool;
  @override
  set rebalancing(bool value) =>
      RealmObjectBase.set(this, 'rebalancing', value);

  @override
  double get taxRateShortTerm =>
      RealmObjectBase.get<double>(this, 'taxRateShortTerm') as double;
  @override
  set taxRateShortTerm(double value) =>
      RealmObjectBase.set(this, 'taxRateShortTerm', value);

  @override
  double get taxRateLongTerm =>
      RealmObjectBase.get<double>(this, 'taxRateLongTerm') as double;
  @override
  set taxRateLongTerm(double value) =>
      RealmObjectBase.set(this, 'taxRateLongTerm', value);

  @override
  int get shortToLongTransition =>
      RealmObjectBase.get<int>(this, 'shortToLongTransition') as int;
  @override
  set shortToLongTransition(int value) =>
      RealmObjectBase.set(this, 'shortToLongTransition', value);

  @override
  double get dividendTax =>
      RealmObjectBase.get<double>(this, 'dividendTax') as double;
  @override
  set dividendTax(double value) =>
      RealmObjectBase.set(this, 'dividendTax', value);

  @override
  double get fwt => RealmObjectBase.get<double>(this, 'fwt') as double;
  @override
  set fwt(double value) => RealmObjectBase.set(this, 'fwt', value);

  @override
  double get stockPurchaseFee =>
      RealmObjectBase.get<double>(this, 'stockPurchaseFee') as double;
  @override
  set stockPurchaseFee(double value) =>
      RealmObjectBase.set(this, 'stockPurchaseFee', value);

  @override
  double get stockPurchaseFlatFee =>
      RealmObjectBase.get<double>(this, 'stockPurchaseFlatFee') as double;
  @override
  set stockPurchaseFlatFee(double value) =>
      RealmObjectBase.set(this, 'stockPurchaseFlatFee', value);

  @override
  double get stockSaleFee =>
      RealmObjectBase.get<double>(this, 'stockSaleFee') as double;
  @override
  set stockSaleFee(double value) =>
      RealmObjectBase.set(this, 'stockSaleFee', value);

  @override
  double get stockSaleFlatFee =>
      RealmObjectBase.get<double>(this, 'stockSaleFlatFee') as double;
  @override
  set stockSaleFlatFee(double value) =>
      RealmObjectBase.set(this, 'stockSaleFlatFee', value);

  @override
  double get accountMaintenanceFee =>
      RealmObjectBase.get<double>(this, 'accountMaintenanceFee') as double;
  @override
  set accountMaintenanceFee(double value) =>
      RealmObjectBase.set(this, 'accountMaintenanceFee', value);

  @override
  double get accountMaintenanceFlatFee =>
      RealmObjectBase.get<double>(this, 'accountMaintenanceFlatFee') as double;
  @override
  set accountMaintenanceFlatFee(double value) =>
      RealmObjectBase.set(this, 'accountMaintenanceFlatFee', value);

  @override
  bool get includeStocks =>
      RealmObjectBase.get<bool>(this, 'includeStocks') as bool;
  @override
  set includeStocks(bool value) =>
      RealmObjectBase.set(this, 'includeStocks', value);

  @override
  bool get includeETF => RealmObjectBase.get<bool>(this, 'includeETF') as bool;
  @override
  set includeETF(bool value) => RealmObjectBase.set(this, 'includeETF', value);

  @override
  bool get includeBonds =>
      RealmObjectBase.get<bool>(this, 'includeBonds') as bool;
  @override
  set includeBonds(bool value) =>
      RealmObjectBase.set(this, 'includeBonds', value);

  @override
  double get stockAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'stockAllocationPercentage') as double;
  @override
  set stockAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'stockAllocationPercentage', value);

  @override
  double get etfAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'etfAllocationPercentage') as double;
  @override
  set etfAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'etfAllocationPercentage', value);

  @override
  double get bondAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'bondAllocationPercentage') as double;
  @override
  set bondAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'bondAllocationPercentage', value);

  @override
  RealmList<CreateStock> get stocks =>
      RealmObjectBase.get<CreateStock>(this, 'stocks')
          as RealmList<CreateStock>;
  @override
  set stocks(covariant RealmList<CreateStock> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<CreateETF> get etfs =>
      RealmObjectBase.get<CreateETF>(this, 'etfs') as RealmList<CreateETF>;
  @override
  set etfs(covariant RealmList<CreateETF> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<CreateBond> get bonds =>
      RealmObjectBase.get<CreateBond>(this, 'bonds') as RealmList<CreateBond>;
  @override
  set bonds(covariant RealmList<CreateBond> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CreatePortfolio>> get changes =>
      RealmObjectBase.getChanges<CreatePortfolio>(this);

  @override
  CreatePortfolio freeze() =>
      RealmObjectBase.freezeObject<CreatePortfolio>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CreatePortfolio._);
    return const SchemaObject(
        ObjectType.realmObject, CreatePortfolio, 'CreatePortfolio', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('duration', RealmPropertyType.int),
      SchemaProperty('monetaryObjective', RealmPropertyType.double),
      SchemaProperty('frequencyInvesting', RealmPropertyType.string),
      SchemaProperty('taxation', RealmPropertyType.bool),
      SchemaProperty('brokerFees', RealmPropertyType.bool),
      SchemaProperty('rebalancing', RealmPropertyType.bool),
      SchemaProperty('taxRateShortTerm', RealmPropertyType.double),
      SchemaProperty('taxRateLongTerm', RealmPropertyType.double),
      SchemaProperty('shortToLongTransition', RealmPropertyType.int),
      SchemaProperty('dividendTax', RealmPropertyType.double),
      SchemaProperty('fwt', RealmPropertyType.double),
      SchemaProperty('stockPurchaseFee', RealmPropertyType.double),
      SchemaProperty('stockPurchaseFlatFee', RealmPropertyType.double),
      SchemaProperty('stockSaleFee', RealmPropertyType.double),
      SchemaProperty('stockSaleFlatFee', RealmPropertyType.double),
      SchemaProperty('accountMaintenanceFee', RealmPropertyType.double),
      SchemaProperty('accountMaintenanceFlatFee', RealmPropertyType.double),
      SchemaProperty('includeStocks', RealmPropertyType.bool),
      SchemaProperty('includeETF', RealmPropertyType.bool),
      SchemaProperty('includeBonds', RealmPropertyType.bool),
      SchemaProperty('stockAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('etfAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('bondAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('stocks', RealmPropertyType.object,
          linkTarget: 'CreateStock', collectionType: RealmCollectionType.list),
      SchemaProperty('etfs', RealmPropertyType.object,
          linkTarget: 'CreateETF', collectionType: RealmCollectionType.list),
      SchemaProperty('bonds', RealmPropertyType.object,
          linkTarget: 'CreateBond', collectionType: RealmCollectionType.list),
    ]);
  }
}
