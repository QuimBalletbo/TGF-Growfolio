// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Portfolio extends _Portfolio
    with RealmEntity, RealmObjectBase, RealmObject {
  Portfolio(
    int id,
  ) {
    RealmObjectBase.set(this, 'id', id);
  }

  Portfolio._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

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
      SchemaProperty('id', RealmPropertyType.int),
    ]);
  }
}
