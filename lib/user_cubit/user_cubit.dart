import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:realm_example/local_user.dart';
import 'package:realm_example/user_cubit/user_repository.dart';

import '../injectable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit()
      : _userRepository = getIt.get<UserRepository>(),
        super(const UserInitial());

  Future<void> addUser(LocalUser user) async {
    try {
      await _userRepository.addUser(user);
      emit(const UserAdded());
    } catch (exception) {
      emit(UserError(exception.toString()));
    }
  }
}
