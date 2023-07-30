import 'package:injectable/injectable.dart';

import '../storage/local_storage.dart';
import '../model/local_user.dart';

abstract interface class UserRepository {
  Future<void> addUser(LocalUser user);

  Future<List<LocalUser>> getAllUser();

  Future<void> deleteUser(LocalUser user);

  Future<void> addMultipleUser(List<LocalUser> users);
}

@Injectable(as: UserRepository)
class DefaultUserRepository implements UserRepository {
  final ILocalStorage _localStorage;

  const DefaultUserRepository(this._localStorage);

  @override
  Future<void> addUser(LocalUser user) async {
    await _localStorage.add(user);
  }

  @override
  Future<List<LocalUser>> getAllUser() async {
    return _localStorage.getAll<LocalUser>().toList();
  }

  @override
  Future<void> addMultipleUser(List<LocalUser> users) async {
    await _localStorage.addList(users);
  }

  @override
  Future<void> deleteUser(LocalUser user) async {
    await _localStorage.delete(user);
  }
}
