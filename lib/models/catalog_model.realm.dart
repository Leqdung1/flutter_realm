// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  Item(int id, String name) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  Item._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Stream<RealmObjectChanges<Item>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Item>(this, keyPaths);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{'id': id.toEJson(), 'name': name.toEJson()};
  }

  static EJsonValue _toEJson(Item value) => value.toEJson();
  static Item _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {'id': EJsonValue id, 'name': EJsonValue name} => Item(
        fromEJson(id),
        fromEJson(name),
      ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Item._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class CatalogModel extends _CatalogModel
    with RealmEntity, RealmObjectBase, RealmObject {
  CatalogModel() {}

  CatalogModel._();

  @override
  Stream<RealmObjectChanges<CatalogModel>> get changes =>
      RealmObjectBase.getChanges<CatalogModel>(this);

  @override
  Stream<RealmObjectChanges<CatalogModel>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<CatalogModel>(this, keyPaths);

  @override
  CatalogModel freeze() => RealmObjectBase.freezeObject<CatalogModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{};
  }

  static EJsonValue _toEJson(CatalogModel value) => value.toEJson();
  static CatalogModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return CatalogModel();
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CatalogModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      CatalogModel,
      'CatalogModel',
      [],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
