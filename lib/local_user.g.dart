// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class LocalUser extends _LocalUser
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalUser(
    ObjectId id,
    String firstName,
    String lastName,
    String gender, {
    String? email,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'email', email);
  }

  LocalUser._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String;
  @override
  set firstName(String value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String;
  @override
  set lastName(String value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String get gender => RealmObjectBase.get<String>(this, 'gender') as String;
  @override
  set gender(String value) => RealmObjectBase.set(this, 'gender', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  Stream<RealmObjectChanges<LocalUser>> get changes =>
      RealmObjectBase.getChanges<LocalUser>(this);

  @override
  LocalUser freeze() => RealmObjectBase.freezeObject<LocalUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LocalUser._);
    return const SchemaObject(ObjectType.realmObject, LocalUser, 'LocalUser', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('firstName', RealmPropertyType.string),
      SchemaProperty('lastName', RealmPropertyType.string),
      SchemaProperty('gender', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
    ]);
  }
}
