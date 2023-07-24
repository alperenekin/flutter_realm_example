part of 'user_cubit.dart';

@immutable
sealed class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoaded extends UserState {
  final List<LocalUser> users;

  const UserLoaded(this.users);
}

class UserAdded extends UserState {
  const UserAdded();
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
}
