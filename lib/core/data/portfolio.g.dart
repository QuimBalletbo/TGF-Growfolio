// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Portfolio extends _Portfolio
    with RealmEntity, RealmObjectBase, RealmObject {
  Portfolio(
    ObjectId id,
    int no,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'no', no);
  }

  Portfolio._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  int get no => RealmObjectBase.get<int>(this, 'no') as int;
  @override
  set no(int value) => RealmObjectBase.set(this, 'no', value);

  @override
  Stream<RealmObjectChanges<Portfolio>> get changes =>
      RealmObjectBase.getChanges<Portfolio>(this);

  @override
  Portfolio freeze() => RealmObjectBase.freezeObject<Portfolio>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Portfolio._);
    return const SchemaObject(ObjectType.realmObject, Portfolio, 'Portfolio', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('no', RealmPropertyType.int),
    ]);
  }
}
