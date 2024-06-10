// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolioReturn.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PortfolioReturn extends _PortfolioReturn
    with RealmEntity, RealmObjectBase, RealmObject {
  PortfolioReturn(
    ObjectId id,
    double allocationScore,
    double amountInvested,
    double avgReturn,
    double bondAllocationPercentage,
    double diversaificationScore,
    int duration,
    double durationScore,
    double etfAllocationPercentage,
    double finalBondValue,
    double finalETFValue,
    double finalStockValue,
    double finalportfolioValue,
    String frequencyInvesting,
    String name,
    double returnScore,
    int score,
    double stockAllocationPercentage,
    String userId, {
    Iterable<AssetReturn> assets = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'allocationScore', allocationScore);
    RealmObjectBase.set(this, 'amountInvested', amountInvested);
    RealmObjectBase.set(this, 'avgReturn', avgReturn);
    RealmObjectBase.set(
        this, 'bondAllocationPercentage', bondAllocationPercentage);
    RealmObjectBase.set(this, 'diversaificationScore', diversaificationScore);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'durationScore', durationScore);
    RealmObjectBase.set(
        this, 'etfAllocationPercentage', etfAllocationPercentage);
    RealmObjectBase.set(this, 'finalBondValue', finalBondValue);
    RealmObjectBase.set(this, 'finalETFValue', finalETFValue);
    RealmObjectBase.set(this, 'finalStockValue', finalStockValue);
    RealmObjectBase.set(this, 'finalportfolioValue', finalportfolioValue);
    RealmObjectBase.set(this, 'frequencyInvesting', frequencyInvesting);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'returnScore', returnScore);
    RealmObjectBase.set(this, 'score', score);
    RealmObjectBase.set(
        this, 'stockAllocationPercentage', stockAllocationPercentage);
    RealmObjectBase.set(this, 'user_id', userId);
    RealmObjectBase.set<RealmList<AssetReturn>>(
        this, 'assets', RealmList<AssetReturn>(assets));
  }

  PortfolioReturn._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get allocationScore =>
      RealmObjectBase.get<double>(this, 'allocationScore') as double;
  @override
  set allocationScore(double value) =>
      RealmObjectBase.set(this, 'allocationScore', value);

  @override
  double get amountInvested =>
      RealmObjectBase.get<double>(this, 'amountInvested') as double;
  @override
  set amountInvested(double value) =>
      RealmObjectBase.set(this, 'amountInvested', value);

  @override
  RealmList<AssetReturn> get assets =>
      RealmObjectBase.get<AssetReturn>(this, 'assets')
          as RealmList<AssetReturn>;
  @override
  set assets(covariant RealmList<AssetReturn> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get avgReturn =>
      RealmObjectBase.get<double>(this, 'avgReturn') as double;
  @override
  set avgReturn(double value) => RealmObjectBase.set(this, 'avgReturn', value);

  @override
  double get bondAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'bondAllocationPercentage') as double;
  @override
  set bondAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'bondAllocationPercentage', value);

  @override
  double get diversaificationScore =>
      RealmObjectBase.get<double>(this, 'diversaificationScore') as double;
  @override
  set diversaificationScore(double value) =>
      RealmObjectBase.set(this, 'diversaificationScore', value);

  @override
  int get duration => RealmObjectBase.get<int>(this, 'duration') as int;
  @override
  set duration(int value) => RealmObjectBase.set(this, 'duration', value);

  @override
  double get durationScore =>
      RealmObjectBase.get<double>(this, 'durationScore') as double;
  @override
  set durationScore(double value) =>
      RealmObjectBase.set(this, 'durationScore', value);

  @override
  double get etfAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'etfAllocationPercentage') as double;
  @override
  set etfAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'etfAllocationPercentage', value);

  @override
  double get finalBondValue =>
      RealmObjectBase.get<double>(this, 'finalBondValue') as double;
  @override
  set finalBondValue(double value) =>
      RealmObjectBase.set(this, 'finalBondValue', value);

  @override
  double get finalETFValue =>
      RealmObjectBase.get<double>(this, 'finalETFValue') as double;
  @override
  set finalETFValue(double value) =>
      RealmObjectBase.set(this, 'finalETFValue', value);

  @override
  double get finalStockValue =>
      RealmObjectBase.get<double>(this, 'finalStockValue') as double;
  @override
  set finalStockValue(double value) =>
      RealmObjectBase.set(this, 'finalStockValue', value);

  @override
  double get finalportfolioValue =>
      RealmObjectBase.get<double>(this, 'finalportfolioValue') as double;
  @override
  set finalportfolioValue(double value) =>
      RealmObjectBase.set(this, 'finalportfolioValue', value);

  @override
  String get frequencyInvesting =>
      RealmObjectBase.get<String>(this, 'frequencyInvesting') as String;
  @override
  set frequencyInvesting(String value) =>
      RealmObjectBase.set(this, 'frequencyInvesting', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get returnScore =>
      RealmObjectBase.get<double>(this, 'returnScore') as double;
  @override
  set returnScore(double value) =>
      RealmObjectBase.set(this, 'returnScore', value);

  @override
  int get score => RealmObjectBase.get<int>(this, 'score') as int;
  @override
  set score(int value) => RealmObjectBase.set(this, 'score', value);

  @override
  double get stockAllocationPercentage =>
      RealmObjectBase.get<double>(this, 'stockAllocationPercentage') as double;
  @override
  set stockAllocationPercentage(double value) =>
      RealmObjectBase.set(this, 'stockAllocationPercentage', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'user_id') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  Stream<RealmObjectChanges<PortfolioReturn>> get changes =>
      RealmObjectBase.getChanges<PortfolioReturn>(this);

  @override
  PortfolioReturn freeze() =>
      RealmObjectBase.freezeObject<PortfolioReturn>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PortfolioReturn._);
    return SchemaObject(
        ObjectType.realmObject, PortfolioReturn, 'PortfolioReturn', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('allocationScore', RealmPropertyType.double),
      SchemaProperty('amountInvested', RealmPropertyType.double),
      SchemaProperty('assets', RealmPropertyType.object,
          linkTarget: 'AssetReturn', collectionType: RealmCollectionType.list),
      SchemaProperty('avgReturn', RealmPropertyType.double),
      SchemaProperty('bondAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('diversaificationScore', RealmPropertyType.double),
      SchemaProperty('duration', RealmPropertyType.int),
      SchemaProperty('durationScore', RealmPropertyType.double),
      SchemaProperty('etfAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('finalBondValue', RealmPropertyType.double),
      SchemaProperty('finalETFValue', RealmPropertyType.double),
      SchemaProperty('finalStockValue', RealmPropertyType.double),
      SchemaProperty('finalportfolioValue', RealmPropertyType.double),
      SchemaProperty('frequencyInvesting', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('returnScore', RealmPropertyType.double),
      SchemaProperty('score', RealmPropertyType.int),
      SchemaProperty('stockAllocationPercentage', RealmPropertyType.double),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
    ]);
  }
}

class AssetReturn extends _AssetReturn
    with RealmEntity, RealmObjectBase, RealmObject {
  AssetReturn(
    ObjectId id,
    double finalValue,
    double monthlyInvestment,
    String name,
    double totalInvestment,
    String userId,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'finalValue', finalValue);
    RealmObjectBase.set(this, 'monthlyInvestment', monthlyInvestment);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'totalInvestment', totalInvestment);
    RealmObjectBase.set(this, 'user_id', userId);
  }

  AssetReturn._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  double get finalValue =>
      RealmObjectBase.get<double>(this, 'finalValue') as double;
  @override
  set finalValue(double value) =>
      RealmObjectBase.set(this, 'finalValue', value);

  @override
  double get monthlyInvestment =>
      RealmObjectBase.get<double>(this, 'monthlyInvestment') as double;
  @override
  set monthlyInvestment(double value) =>
      RealmObjectBase.set(this, 'monthlyInvestment', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get totalInvestment =>
      RealmObjectBase.get<double>(this, 'totalInvestment') as double;
  @override
  set totalInvestment(double value) =>
      RealmObjectBase.set(this, 'totalInvestment', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'user_id') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'user_id', value);

  @override
  Stream<RealmObjectChanges<AssetReturn>> get changes =>
      RealmObjectBase.getChanges<AssetReturn>(this);

  @override
  AssetReturn freeze() => RealmObjectBase.freezeObject<AssetReturn>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AssetReturn._);
    return SchemaObject(ObjectType.realmObject, AssetReturn, 'AssetReturn', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('finalValue', RealmPropertyType.double),
      SchemaProperty('monthlyInvestment', RealmPropertyType.double),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('totalInvestment', RealmPropertyType.double),
      SchemaProperty('userId', RealmPropertyType.string, mapTo: 'user_id'),
    ]);
  }
}
