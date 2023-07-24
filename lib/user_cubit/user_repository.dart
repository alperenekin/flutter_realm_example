import 'package:injectable/injectable.dart';
import 'package:realm_example/local_user.dart';

import '../local_storage.dart';

abstract interface class UserRepository {
  Future<void> addUser(LocalUser user);
}

@Injectable(as: UserRepository)
class DefaultUserRepository implements UserRepository {
  final ILocalStorage _localStorage;

  const DefaultUserRepository(this._localStorage);

  @override
  Future<void> addUser(LocalUser user) async {
    await _localStorage.add(user);
  }
}
