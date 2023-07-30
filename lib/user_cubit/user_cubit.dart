import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:realm/realm.dart';
import 'package:realm_example/user_repository/user_repository.dart';

import '../injectable.dart';
import '../model/local_user.dart';

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
      await getAllUser();
    } catch (exception) {
      emit(UserError(exception.toString()));
    }
  }

  Future<void> getAllUser() async {
    try {
      final users = await _userRepository.getAllUser();
      emit(UserLoaded(users));
    } catch (exception) {
      emit(UserError(exception.toString()));
    }
  }

  Future<void> deleteUser(LocalUser? user) async {
    try {
      if (user == null) throw Exception('User can not be null');
      await _userRepository.deleteUser(user);
      emit(const UserDeleted());
      await getAllUser();
    } catch (exception) {
      emit(UserError(exception.toString()));
    }
  }

  Future<void> addMultipleUser() async {
    try {
      await _userRepository.addMultipleUser(localUsers);
      emit(const UserAdded());
      await getAllUser();
    } catch (exception) {
      emit(UserError(exception.toString()));
    }
  }
}

List<LocalUser> localUsers = [
  LocalUser(ObjectId(), 'John', 'Doe', 'Male', email: 'john.doe@example.com'),
  LocalUser(ObjectId(), 'Jane', 'Smith', 'Female', email: 'jane.smith@example.com'),
  LocalUser(ObjectId(), 'Michael', 'Johnson', 'Male', email: 'michael.johnson@example.com'),
  LocalUser(ObjectId(), 'Emily', 'Davis', 'Female'),
  LocalUser(ObjectId(), 'Robert', 'Wilson', 'Male'),
];
