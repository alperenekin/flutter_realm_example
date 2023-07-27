import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';
import 'local_user.dart';

abstract interface class ILocalStorage {
  Iterable<M> getAll<M extends RealmObject>();

  Future<M> add<M extends RealmObject>(M item);

  Future<void> addList<M extends RealmObject>(Iterable<M> items);

  Future<M> update<M extends RealmObject>(M item);

  Future<void> delete<M extends RealmObject>(M item);

  M? find<M extends RealmObject>(Uuid primaryKey);

  void dispose();
}

@Singleton(as: ILocalStorage)
class RealmStorage implements ILocalStorage {
  late final Realm _realm;

  RealmStorage() {
    _realm = Realm(Configuration.local(
      [LocalUser.schema],
      schemaVersion: 1,
    ));
  }

  @override
  Iterable<M> getAll<M extends RealmObject>() {
    return _realm.all<M>();
  }

  @override
  Future<M> add<M extends RealmObject>(M item) {
    return _realm.writeAsync(() => _realm.add(item));
  }

  @override
  Future<void> addList<M extends RealmObject>(Iterable<M> items) async {
    await _realm.writeAsync(() => _realm.addAll<M>(items));
  }

  @override
  Future<M> update<M extends RealmObject>(M item) {
    return _realm.writeAsync(() => _realm.add(item, update: true));
  }

  @override
  Future<void> delete<M extends RealmObject>(M item) async {
    await _realm.writeAsync(() => _realm.delete(item));
  }

  @override
  M? find<M extends RealmObject>(Object primaryKey) {
    return _realm.find<M>(primaryKey);
  }

  @override
  void dispose() {
    _realm.close();
  }
}
