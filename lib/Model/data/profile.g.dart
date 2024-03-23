// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  Profile(
    ObjectId id,
    String userName,
    String userId,
    int portfolionum,
    String preferedAssetclass,
    String bestPerformingPortfolio,
    String riskiestPortfolio,
    String bestPortfolio,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'portfolionum', portfolionum);
    RealmObjectBase.set(this, 'preferedAssetclass', preferedAssetclass);
    RealmObjectBase.set(
        this, 'bestPerformingPortfolio', bestPerformingPortfolio);
    RealmObjectBase.set(this, 'riskiestPortfolio', riskiestPortfolio);
    RealmObjectBase.set(this, 'bestPortfolio', bestPortfolio);
  }

  Profile._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String;
  @override
  set userName(String value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  int get portfolionum => RealmObjectBase.get<int>(this, 'portfolionum') as int;
  @override
  set portfolionum(int value) =>
      RealmObjectBase.set(this, 'portfolionum', value);

  @override
  String get preferedAssetclass =>
      RealmObjectBase.get<String>(this, 'preferedAssetclass') as String;
  @override
  set preferedAssetclass(String value) =>
      RealmObjectBase.set(this, 'preferedAssetclass', value);

  @override
  String get bestPerformingPortfolio =>
      RealmObjectBase.get<String>(this, 'bestPerformingPortfolio') as String;
  @override
  set bestPerformingPortfolio(String value) =>
      RealmObjectBase.set(this, 'bestPerformingPortfolio', value);

  @override
  String get riskiestPortfolio =>
      RealmObjectBase.get<String>(this, 'riskiestPortfolio') as String;
  @override
  set riskiestPortfolio(String value) =>
      RealmObjectBase.set(this, 'riskiestPortfolio', value);

  @override
  String get bestPortfolio =>
      RealmObjectBase.get<String>(this, 'bestPortfolio') as String;
  @override
  set bestPortfolio(String value) =>
      RealmObjectBase.set(this, 'bestPortfolio', value);

  @override
  Stream<RealmObjectChanges<Profile>> get changes =>
      RealmObjectBase.getChanges<Profile>(this);

  @override
  Profile freeze() => RealmObjectBase.freezeObject<Profile>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Profile._);
    return const SchemaObject(ObjectType.realmObject, Profile, 'Profile', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('portfolionum', RealmPropertyType.int),
      SchemaProperty('preferedAssetclass', RealmPropertyType.string),
      SchemaProperty('bestPerformingPortfolio', RealmPropertyType.string),
      SchemaProperty('riskiestPortfolio', RealmPropertyType.string),
      SchemaProperty('bestPortfolio', RealmPropertyType.string),
    ]);
  }
}
